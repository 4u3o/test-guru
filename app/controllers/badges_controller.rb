# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @user_badges = current_user.badges.distinct
    @other_badges = Badge.all - @user_badges
  end
end
