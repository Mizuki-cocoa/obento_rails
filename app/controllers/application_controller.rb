class ApplicationController < ActionController::Base
    private def current_customer
        Customer.find_by(id: cookies.signed[:customer_id]) if cookies.signed[:customer_id]
    end
    helper_method :current_customer

    class LoginRequired < StandardError; end
    class Forbidden < StandardError; end

    private def login_required
        raise LoginRequired unless current_customer
    end
end