class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  scope :titles_by_category, -> (title) do
    joins(:category)
      .where(category: {title: title})
      .order(title: :desc)
      .pluck(:title)
  end
end
