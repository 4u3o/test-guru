class QuestionsController < ApplicationController
  before_action :find_test, only: %i(index create new)
  before_action :find_question, except: %i(index create new)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def create
    # Вопросы без ответов не создаются
    question = @test.questions.new(question_params)

    if question.save
      redirect_to question_path(question)
    else
      render plain: 'Question not created', status: :bad_request
    end
  end

  def new
    # ActionView::Template::Error (Webpacker can't find application.js in .../test-guru/public/packs/manifest.json
    render :new, layout: false
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.required(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found', status: :not_found
  end
end
