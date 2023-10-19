# frozen_string_literal: true

class Admin::TestsController < Admin::ApplicationController
  before_action :set_test, except: %i[index create new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.includes(:questions)
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.authored_tests.build(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.required(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: t('tests.not_found'), status: :not_found
  end
end
