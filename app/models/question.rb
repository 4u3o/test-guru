class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, :answers, presence: true
end
