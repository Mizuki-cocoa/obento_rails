class Admin::LoginController < ApplicationController
  before_action :admin_login_required
  layout "login"
  
  def index
    @admins = Admin.order("id")
  end
end
