class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  private

    def admin_required!
      redirect_to root_path, alert: t('.not_authorized') unless current_user.admin?
    end
end
