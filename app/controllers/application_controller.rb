class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(user)
    flash['notice'] = "Hello, #{user}"
    logger.debug flash.inspect
    user.admin? ? admin_tests_path : root_path
  end
end
