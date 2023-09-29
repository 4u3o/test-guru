class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:path]
    else
      flash.now[:alert] = 'Verify you email and password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are logged out'
  end
end
