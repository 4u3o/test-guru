class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, uniqueness: { scope: :level }, presence: true
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  scope :by_category, -> (title) do
    joins(:category).where(category: {title: title})
  end

  def self.titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
