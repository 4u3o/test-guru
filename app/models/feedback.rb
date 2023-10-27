# frozen_string_literal: true

class Feedback
  include ActiveModel::Model

  attr_accessor :subject, :content, :from

  validates :content, :from, presence: true
end
