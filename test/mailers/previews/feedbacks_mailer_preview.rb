# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/feedbacks_mailer/message
  def message
    FeedbacksMailer.feedback
  end

end
