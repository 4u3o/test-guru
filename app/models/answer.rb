class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_count
    errors.add(:answers, "must be no more than #{Question::MAX_ANSWERS}") if
      question.answers.count >= Question::MAX_ANSWERS
  end
end
