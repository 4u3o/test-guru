# frozen_string_literal: true

class Admin::GistsController < Admin::ApplicationController
  def index
    @gists = Gist.includes(:user, :question)
  end
end
