# frozen_string_literal: true

class Feedback
  attr_accessor :subject, :content, :from

  def initialize(params = {})
    @subject = params[:subject]
    @content = params[:content]
    @from = params[:from]
  end

  def valid?
    content.present? && from.present?
  end
end
