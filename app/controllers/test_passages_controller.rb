class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    render :result if @test_passage.completed?
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.present?
      redirect_to @test_passage, notice: t('.success_html', link: result.html_url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
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
