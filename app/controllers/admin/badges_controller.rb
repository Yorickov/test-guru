class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]
  before_action :new_badge, only: %i[level category all first]

  def index
    @badges = Badge.all
  end

  def new; end

  def level; end

  def category; end

  def all; end

  def first; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      rule_name = params[:badge][:rule_name]
      render rule_name
    end
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.success')
  end

  private

  def badge_params
    params.require(:badge).permit(
      :title, :description, :filename, :rule_name, :rule_param
    )
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def new_badge
    @badge = Badge.new
  end
end
