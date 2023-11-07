# frozen_string_literal: true

class BadgesService
  attr_reader :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @badges = []
  end

  def call
    Badge.all.each do |badge|
      if badge_earned?(badge)
        test_passage.user.badges << badge
        badges << badge
      end
    end
  end

  private

  attr_reader :test_passage, :user

  def badge_earned?(badge)
    send(badge.rule.to_sym, badge)
  end

  def attempt(badge)
    test_passage.success? && first_pass?(badge.rule_value)
  end

  def level(badge)
    (Test.where(level: badge.rule_value).ids - user.success_test_ids).empty?
  end

  def category(badge)
    (Test.by_category(badge.rule_value).ids - user.success_test_ids).empty?
  end

  def first_pass?(attempt_value)
    test_passage.attempt_count == attempt_value.to_i
  end
end
