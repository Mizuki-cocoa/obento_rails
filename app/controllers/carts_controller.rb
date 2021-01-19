class CartsController < ApplicationController
    def index
        @allkcal = current_customer.cart.all_kcal
        @allsum = current_customer.cart.sum_price
        @allkcal1=0
        @allsum1=0
        @id=current_customer.id
        @cart = Cart.find(@id)
        Customer.find(@id).cart.bentos.each do |c|
            @allkcal+=c.sum_kcal*c.num
            @allsum+=Box.find(c.box_id).box_price.to_i*c.num
        end

        Cart.find(@id).associations.ids.each do |a|
            @num=Association.find(a).num
            @allkcal+=SubDish.find(Association.find(a).sub_dish_id).sub_kcal*@num
            @allsum+=SubDish.find(Association.find(a).sub_dish_id).sub_dish_price*@num
        end

        @allkcal1+=@allkcal
        @allsum1+=@allsum

        @cart.all_kcal=@allkcal1
        @cart.sum_price=@allsum1
    end
end