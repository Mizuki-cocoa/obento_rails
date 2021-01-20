class AdminSessionsController < ApplicationController
    def create
      admin = Admin.find_by(name: params[:name])
      if admin&.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_root_path
      else
        flash.alert = "名前とパスワードが一致しません"
        redirect_to admin_login_index_path
      end
    end
  
    def destroy
      session.delete(:admin_id)
      redirect_to :root
    end
end