class Admin::LoginController < ApplicationController
  layout "login"
  
  def index
    @admins = Admin.order("id")
  end

  def show
    
  end
end
