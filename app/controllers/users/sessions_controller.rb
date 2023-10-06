# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super do |user|
      flash.notice = "Привет, #{user.first_name}!" if user.first_name
    end
  end
end
