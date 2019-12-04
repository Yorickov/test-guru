class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  include AuthManagement

  private

  def authenticate_user!
    return if current_user

    redirect_to signin_path, alert: "Are you a Guru? Verify
      \ your Email and Password please"

    cookies[:email] = current_user&.email
  end
end
