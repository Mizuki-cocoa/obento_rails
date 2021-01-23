class CartsController < ApplicationController
    before_action :login_required
    def index
        # if Customer.find(current_customer.id).present?
        #     @cart=Cart.create(id: current_customer.id, customer_id: current_customer.id)
        # end
        @allkcal1=0
        @allsum1=0
        @cart = Cart.find(current_customer.id)
        @cart.bentos.each do |c|
            @allkcal1+=c.sum_kcal*c.num
            @allsum1+=Box.find(c.box_id).box_price.to_i*c.num
        end

        @cart.associations.ids.each do |a|
            @num=Association.find(a).num
            @allkcal1+=SubDish.find(Association.find(a).sub_dish_id).sub_kcal*@num
            @allsum1+=SubDish.find(Association.find(a).sub_dish_id).sub_dish_price*@num
        end

        @cart.all_kcal=@allkcal1
        @cart.sum_price=@allsum1
        @cart.save
    end

    def create
        current_customer.cart.bentos.each do |b|
            b.update(cart_id: -1)
        end
    
        current_customer.cart.associations.each do |a|
            a.update(cart_id: -1)
        end
        redirect_to :carts, notice: "Cartの内容を全消去しました"
    end
end