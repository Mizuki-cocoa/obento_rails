class CustomersController < ApplicationController
    before_action :login_required, except: [:new]
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def new
        @customer = Customer.new()
    end
end
