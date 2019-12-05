class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include AuthManagement

  before_action :authenticate_user!

  private

  def authenticate_user!
    return if current_user

    redirect_to signin_path, flash: {
      danger: 'Are you a Guru? Verify your Email and Password please'
    }
    cookies[:no_auth] = request.url
  end
end
