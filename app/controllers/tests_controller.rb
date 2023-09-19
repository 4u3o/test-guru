class TestsController < ApplicationController
  before_action :find_test, except: %i(index create new)
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: Test.all.inspect
  end

  def create
    test = Test.new(test_params)

    if test.save
      render root_path
    else
      render plain: 'Test not created', status: :bad_request
    end
  end

  def new
    render :new, layout: false
  end

  def destroy
    @test.destroy
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
