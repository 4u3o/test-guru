class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:redirect_path] || root_path
    else
      flash[:alert] = 'Verify you email and password please'
      debugger
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are logged out'
  end
end
