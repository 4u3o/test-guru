# frozen_string_literal: true

class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
    @feedback.from = current_user.email if user_signed_in?
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.with(feedback: @feedback).feedback.deliver_now
      redirect_to root_path, notice: t('.create')
    else
      render :new
    end
  end


  private

  def feedback_params
    params.required(:feedback).permit(:subject, :content, :from)
  end
end
