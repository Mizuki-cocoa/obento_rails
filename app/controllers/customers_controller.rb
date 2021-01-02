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
    
    def create
        @customer = Customer.new(params[:customer])
        if @customer.save
            redirect_to @customer, notice: "会員を登録しました。"
        else
            render "/customers/new"
        end
    end
end
