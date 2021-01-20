class AdminAccountsController < ApplicationController
    before_action :admin_login_required, except: [:new , :create]
    layout "admin"
  
    def show
      @admin = current_admin
    end
  
    def new
      @admin = Admin.new()
    end
  
    def edit
      @admin = current_admin
    end
  
    def create
      @admin = Customer.new(params[:admin])
      if @admin.save
        cookies.signed[:admin_id] = { value: @admin.id, expires: 5.minutes.from_now }
        redirect_to :root, notice: "会員を登録しました。"
      else
        render "new"
      end
    end
  
    def update
      @admin = current_admin
      @admin.assign_attributes(admin_account_params)
      if @admin.save
        redirect_to :admin_account, notice: "アカウント情報を更新しました。"
      else
        render "edit"
      end
    end
  
    # ストロング・パラメータ
    private def admin_account_params
      params.require(:account).permit(
        :name
      )
    end
end
