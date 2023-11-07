# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATE = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  scope :success, -> { where(success: true) }

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def result_success?
    result >= SUCCESS_RATE
  end

  def result
    return 0 if test.questions_count.zero?

    correct_questions.to_f / test.questions_count
  end

  def current_question_number
    questions.ids.index(current_question_id).next
  end

  def attempt_count
    TestPassage.where(user:, test:).count
  end

  private

  def questions
    test.questions
  end

  def next_questions
    questions.where('id > ?', current_question_id)
  end

  def set_current_question
    self.current_question =
      new_record? ? questions.first : next_questions.first
  end

  def correct_answer?(answer_ids)
    return correct_answers.ids.empty? if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
