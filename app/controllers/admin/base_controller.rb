class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout 'admin'

  private

  def admin_required!
    return if current_user.admin?

    redirect_to root_path, alert: 'You are not authorized to view this page.'
  end
end
