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
        @customer.destroy
        redirect_to [:admin, @customer], notice: "おかずを削除しました。"
    end
end
