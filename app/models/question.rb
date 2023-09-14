class Question < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :test
  has_many :answers

  validates :body, :answers, presence: true
end
