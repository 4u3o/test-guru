# frozen_string_literal: true

class Admin::BadgesController < Admin::ApplicationController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to edit_admin_badge_path(@badge), notice: t('.success')
    else
      redirect_to edit_admin_badge_path(@badge), notice: t('.failure')
    end
  end

  def destroy
    if @badge.destroy
      redirect_to admin_badges_path, notice: t('.success')
    else
      redirect_to admin_badges_path, notice: t('.failure')
    end
  end

  private

  def badge_params
    params.required(:badge).permit(:title, :img, :rule, :rule_value)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end
