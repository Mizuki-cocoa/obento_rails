class Admin::CustomersController < Admin::Base
    before_action :admin_login_required
    def index
        @customers = Customer.all.order(:id)
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def destroy
        @customer=Customer.find(params[:id])
        Cart.find(params[:id]).destroy
        @customer.destroy
        redirect_to admin_customers_pass, notice: "会員を削除しました"
    end
end
