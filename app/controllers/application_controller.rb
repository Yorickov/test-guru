class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :switch_locale

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer
      .permit(:account_update, keys: %i[first_name last_name email])
  end

  def after_sign_in_path_for(user)
    flash['notice'] = t('.hello') # "Hello, #{user}"
    logger.debug flash.inspect
    user.admin? ? admin_tests_path : root_path
  end

  private

  def switch_locale
    I18n.locale = I18n.locale_available?(params[:lang]) && params[:lang] ||
                  I18n.default_locale
  end
end
