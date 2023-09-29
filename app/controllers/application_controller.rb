class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

    def authenticate_user!
      unless current_user
        session[:path] = request.path
        redirect_to login_path, alert: 'Verify you email and password please'
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user.present?
    end
end
