class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :questions

  def self.titles_by_category(title)
    self.joins(:category)
        .where(category: {title: title})
        .order(title: :desc)
        .pluck(:title)
  end
end
