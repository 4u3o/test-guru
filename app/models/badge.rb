# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  enum rule: { attempt: 'attempt', level: 'level', category: 'category' }

  def earned?(test_passage)
    rule_proc.call(test_passage)
  end

  private

  def rule_proc
    {
      'attempt' => proc do |test_passage|
        test_passage.success? && first_pass?(test_passage)
      end,
      'level' => proc do |test_passage|
        (Test.where(level: rule_value).ids - success_test_ids(test_passage.user)).empty?
      end,
      'category' => proc do |test_passage|
        (Category.find_by(title: rule_value).tests.ids - success_test_ids(test_passage.user)).empty?
      end
    }[rule]
  end

  def first_pass?(test_passage)
    test_passage.user.test_passages.where(test_id: test_passage.test_id).length == 1
  end

  def success_test_ids(user)
    user.test_passages.filter(&:success?).map(&:test_id)
  end
end
