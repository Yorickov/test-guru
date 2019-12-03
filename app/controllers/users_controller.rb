class UsersController < ApplicationController
  before_action :find_user, only: %i[show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show; end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user].permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
