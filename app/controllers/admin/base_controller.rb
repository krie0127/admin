class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def not_authenticated
    flash[:warning] = 'Login required.'
    redirect_to admin_login_path
  end

  def check_admin
    redirect_to admin_login_path, warning: 'Admin required.' unless current_user.admin?
  end
end
