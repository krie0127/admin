class Admin::BaseController < ApplicationController
    before_action :check_admin
    layout 'admin/layouts/application'
  
    private
  
    def not_authenticated
      flash[:warning] = t('defaults.message.require_login')
    end
  
    def check_admin
      redirect_to root_path, warning: t('defaults.message.not_autheorized') unless current_user&.admin?
    end 
  end
  