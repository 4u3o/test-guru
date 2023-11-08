# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show
    render :result if @test_passage.completed?
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now

      if @test_passage.result_success?
        @test_passage.update(success: true)

        bs = BadgesService.new(@test_passage)
        bs.call

        flash[:notice] = t(:earned) if bs.badges.any?
      end

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
