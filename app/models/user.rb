class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', inverse_of: 'author'
  has_many :test_passages
  has_many :tests, through: :test_passages, inverse_of: 'users'

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
