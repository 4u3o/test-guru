class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @test.questions.find(params[:id]).inspect
  end

  def create
    question = @test.questions.create(question_params)

    redirect_to test_questions_path(test_id: question.test_id)
  end

  def new
    # ActionView::Template::Error (Webpacker can't find application.js in .../test-guru/public/packs/manifest.json
    render :new, layout: false
  end

  def destroy
    question = @test.questions.find(params[:id])
    @test.questions.destroy(question)
  end

  private

  def question_params
    params.required(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found', status: :not_found
  end
end
