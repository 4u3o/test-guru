# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(:title) }

  has_many :tests

  validates :title, presence: true
end
