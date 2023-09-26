class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :set_first_question, on: :create
  # before_update :next_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  private

    def set_first_question
      self.current_question = test.questions.first if test.present?
    end

    def correct_answer?(answer_ids)
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end

    def correct_answers
      current_question.answers.correct
    end

    def next_question
      test.questions.where('id > ?', current_question.id).first
    end
end
