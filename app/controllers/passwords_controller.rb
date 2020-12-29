class PasswordsController < ApplicationController
  before_action :login_required
  def show
    redirect_to :account
  end

  def edit
    @customer= current_customer
  end

  def update
    @customer= current_customer
    current_password=params[:account][:current_password]
    if current_password.present?
      if @customer.authenticate(current_password)
        @customer.assign_attributes(params[:account])
        if @customer.save
          redirect_to :account, notice: "パスワードを変更しました。"
        else
          render "edit"
        end
      else
        @customer.errors.add(:current_password, :wrong)
        render "edit"
      end
    end
  end
end
