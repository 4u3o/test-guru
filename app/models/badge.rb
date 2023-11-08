# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  enum rule: { attempt: 'attempt', level: 'level', category: 'category' }
end
