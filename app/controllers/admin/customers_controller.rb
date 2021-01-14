class Admin::CustomersController < Admin::Base
    before_action :basic_auth
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end
end
