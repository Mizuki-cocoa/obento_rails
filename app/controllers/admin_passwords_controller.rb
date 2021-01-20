class AdminPasswordsController < ApplicationController
    before_action :admin_login_required
    layout "admin"
  
    def show
      redirect_to :admin_account
    end
  
    def edit
      @admin = current_admin
    end
  
    def update
      @admin = current_admin
      current_password = admin_account_params[:current_password]
  
      if current_password.present?
        if @admin.authenticate(current_password)
          @admin.assign_attributes(admin_account_params)
          if @admin.save
            redirect_to :admin_account, notice: "パスワードを変更しました。"
          else
            render "edit"
          end
        else
          @admin.errors.add(:current_password, :wrong)
          render "edit"
        end
      else
        @admin.errors.add(:current_password, :empty)
        render "edit"
      end
    end
  
    # ストロング・パラメータ
    private def admin_account_params
      params.require(:account).permit(
        :current_password,
        :password,
        :password_confirmation
      )
    end
end
