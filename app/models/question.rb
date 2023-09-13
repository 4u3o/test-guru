class Question < ApplicationRecord
  MIN_ANSWERS = 1
  MAX_ANSWERS = 4

  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:answers, "must be from #{MIN_ANSWERS} to #{MAX_ANSWERS}") unless
      answers.count.between?(MIN_ANSWERS, MAX_ANSWERS)
  end
end
