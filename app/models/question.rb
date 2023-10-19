class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, reverse_of: 'question'

  validates :body, presence: true
end
