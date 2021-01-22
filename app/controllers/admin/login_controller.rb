class Admin::LoginController < ApplicationController
  layout "login"
  
  def index
    @admins = Admin.order("id")
  end
end
