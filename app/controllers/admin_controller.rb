class AdminController < ApplicationController
    before_action :admin_login_required
    def index
        @admins = Admin.order("id")
      end
    
      def show
        @admin = Admin.find(params[:id])
      end
    
      def new
        @admin = Admin.new()
      end
    
      def edit
        @admin = Admin.find(params[:id])
      end
    
      def create
        @admin = Admin.new(params[:admin])
        if @admin.save
          redirect_to @admin, notice: "会員を登録しました。"
        else
          render "new"
        end
      end
    
      def update
        @admin = Admin.find(params[:id])
        @admin.assign_attributes(params[:admin])
        if @admin.save
          redirect_to @admin, notice: "会員情報を更新しました。"
        else
          render "edit"
        end
      end
    
      def destroy
        @admin = Admin.find(params[:id])
        @admin.destroy
        redirect_to :customers, notice: "会員を削除しました。"
      end
end
