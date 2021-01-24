class AdminController < ApplicationController
    before_action :admin_login_required
    def index
        @admins = Admin.order("id")
      end
    
      def show
        @admin = Admin.find(params[:id])
      end
end
