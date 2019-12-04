class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:user][:email])

    if user&.authenticate(params[:user][:password])
      sign_in(user)
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
