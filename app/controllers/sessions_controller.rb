class SessionsController < ApplicationController
    def create
        customer=Customer.find_by(user_name: params[:user_name])
        if customer&.authenticate(params[:password])
            cookies.signed[:customer_id]={value: customer.id}
        else
            flash.alert="名前とパスワードが一致しません"
        end
        redirect_to :root
    end

    def destroy
        cookies.delete(:customer_id)
        redirect_to :root
    end
end
