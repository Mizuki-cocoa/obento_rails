class OrdersController < ApplicationController
  before_action :login_required
  def index
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders
    else
      @orders = Order.all
    end

    @orders = @orders.readable_for(current_customer)
      .order(posted_at: :desc)
  end

  def show
    @order = Order.readable_for(current_customer).find(params[:id])
  end

  def new
  end

  def edit
  end
end
