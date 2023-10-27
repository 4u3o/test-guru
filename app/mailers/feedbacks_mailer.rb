# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  def feedback
    @feedback = params[:feedback]
    admin = Admin.first
    return if admin.nil?

    mail(to: admin.email, subject: t('.subject', from: @feedback.from))
  end
end
