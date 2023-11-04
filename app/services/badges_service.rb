# frozen_string_literal: true

class BadgesService
  def initialize(test_passage, flash)
    @test_passage = test_passage
    @flash = flash
  end

  def call
    Badge.all.each do |badge|
      if badge.earned?(test_passage)
        test_passage.user.badges << badge
        flash[:notice] ||= I18n.t('.earned')
      end
    end
  end

  private

  attr_reader :test_passage, :flash
end
