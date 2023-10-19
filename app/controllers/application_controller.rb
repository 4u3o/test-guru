# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    if I18n.locale == I18n.default_locale
      {}
    else
      { lang: I18n.locale }
    end
  end

  private

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def set_locale
    I18n.locale =
      if I18n.locale_available?(params[:lang])
        params[:lang]
      else
        I18n.default_locale
      end
  end
end
