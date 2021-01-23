class Admin::CustomersController < Admin::Base
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
        redirect_to admin_customers_path, notice: "会員を削除しました"
    end
end
