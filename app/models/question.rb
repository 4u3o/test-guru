# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, inverse_of: 'question', dependent: :destroy
  has_many :test_passages, foreign_key: 'current_question_id', inverse_of: 'current_question', dependent: :destroy

  validates :body, presence: true
end
