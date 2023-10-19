class GistsController < ApplicationController
  before_action :set_test_passage, only: :create

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.nil?
      return redirect_to @test_passage, alert: t('.failure')
    end

    gist = Gist.new(
      user: current_user,
      question: @test_passage.current_question,
      url_hash: result.id
    )

    if gist.save
      redirect_to @test_passage, notice: t('.success_html', link: result.html_url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
