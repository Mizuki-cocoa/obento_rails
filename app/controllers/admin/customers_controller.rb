class Admin::CustomersController < Admin::Base
    before_action :basic_auth
    def index
        @customers = Customer.all
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
