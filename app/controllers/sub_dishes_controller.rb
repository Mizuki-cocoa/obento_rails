class SubDishesController < ApplicationController
    before_action :login_required
    def index
        @sub_dishes = SubDish.all
    end

    def show
        @sub_dish = SubDish.find(params[:id])
    end

    def create
        if params[:cart].present?
            for i in 1..(params[:cart].length)
                @kosuu = params[:cart][i-1].to_i
                if @kosuu != 0
                    @association=Association.new
                    @association.sub_dish_id=i
                    @association.cart_id=current_customer.id
                    @association.num=@kosuu
                    unless @association.save
                        redirect_to sub_dishes_path
                    end
                end
            end
            redirect_to carts_path
        end
    end
end
