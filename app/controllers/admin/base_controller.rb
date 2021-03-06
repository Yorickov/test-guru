class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout 'admin'

  private

  def admin_required!
    redirect_to root_path, alert: t('.auth') unless current_user.admin?
  end
end
