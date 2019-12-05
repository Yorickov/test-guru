class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create new]

  def new; end

  def create
    user = User.find_by(email: params[:user][:email])

    if user&.authenticate(params[:user][:password])
      sign_in(user)

      path = cookies[:no_auth] || root_path
      redirect_to path, flash: { info: "Welcome back, #{current_user}" }
    else
      flash.now[:info] = 'Are you a Guru? Verify your Email and Password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, flash: { info: 'See you later' }
  end
end
