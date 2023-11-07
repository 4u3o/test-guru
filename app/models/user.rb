# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: 'author'
  has_many :test_passages
  has_many :tests, through: :test_passages, inverse_of: 'users'
  has_many :gists, inverse_of: 'user'
  has_many :badges_users
  has_many :badges, through: :badges_users

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a? Admin
  end

  def success_test_ids
    test_passages.success.pluck(:test_id)
  end
end
