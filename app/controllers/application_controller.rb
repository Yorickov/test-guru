class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user

  private

  def authenticate_user!
    redirect_to signin_path unless current_user
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end
end
