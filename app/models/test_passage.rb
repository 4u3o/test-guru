class TestPassage < ApplicationRecord
  SUCCESS_RATE = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    result >= SUCCESS_RATE
  end

  def result
    correct_questions.to_f / test.questions_count
  end

  def current_question_number
    test.questions.ids.index(current_question_id).next
  end

  private

    def set_current_question
      self.current_question =
        new_record? ?
          test.questions.first :
          test.questions.where('id > ?', current_question_id).first
    end

    def correct_answer?(answer_ids)
      return correct_answers.ids.empty? if answer_ids.nil?

      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end

    def correct_answers
      current_question.answers.correct
    end
end
