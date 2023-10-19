class Gist < ApplicationRecord
  QUESTION_LENGTH = 25

  belongs_to :question
  belongs_to :user
end
