class OrdersController < ApplicationController
  before_action :login_required
  def index
    @orders=Order.all
  end

  def show
    @order = Order.all
  end

  def new
  end

  def edit
  end
end
