# frozen_string_literal: true

class Admin::QuestionsController < Admin::ApplicationController
  before_action :set_test, only: %i[create new]
  before_action :set_question, except: %i[create new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @question], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test]
  end

  private

  def question_params
    params.required(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: t('.not_found'), status: :not_found
  end
end
