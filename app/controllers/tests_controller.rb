class TestsController < ApplicationController
  before_action :find_test, except: %i(index create new)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.joins(:questions)
                 .select('tests.*, COUNT(questions.id) as questions_count')
                 .group('tests.id')
  end

  def show
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to root_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.required(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found', status: :not_found
  end
end
