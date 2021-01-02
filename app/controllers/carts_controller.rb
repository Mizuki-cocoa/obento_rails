class CartsController < ApplicationController
    def index
        @allsum = current_customer.cart.sum_price
        @allkcal = current_customer.cart.all_kcal
        @carts = Cart.all
    end
end
