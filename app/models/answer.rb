class Answer < ApplicationRecord
  MAX_COUNT = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_count
    errors.add(:answers, "must be no more than #{MAX_COUNT}") if
      new_record? && question.answers.count >= MAX_COUNT
  end
end
