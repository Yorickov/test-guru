class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private

  def authenticate_user!
    return if current_user

    redirect_to signin_path, alert: "Are you a Guru? Verify
      \ your Email and Password please"

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end
end
