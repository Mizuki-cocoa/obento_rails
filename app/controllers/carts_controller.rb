class CartsController < ApplicationController
    def index
        @bento = Bento.new
        @bento.box_id = params[:box]
        @allkcal = current_customer.cart.all_kcal
        @allsum = current_customer.cart.sum_price
        @cart = current_customer.cart

        if params[:cart].present?
            for i in 1..(params[:cart].length)
                @kosuu = params[:cart][i-1].to_i
                if @kosuu != 0
                    @allkcal += SubDish.find(i).sub_kcal.to_i * @kosuu 
                    @allsum += SubDish.find(i).sub_dish_price.to_i * @kosuu 
                end
            end
        end

        if params[:dish].present?
            @kosuu=params[:dish].length
            for i in 0..(@kosuu.to_i-1)
                @allkcal += Dish.find(params[:dish]).dish_kcal.to_i*params[:sum].to_i
            end
            @allsum += Box.find(params[:box]).box_price * params[:sum].to_i
        end

        @cart.all_kcal+=@allkcal
        @cart.sum_price+=@allsum

        # if @cart.save && @bento.save
        #     redirect_to carts_path
        # else
        #     render "/carts/index"
        # end
    end
end