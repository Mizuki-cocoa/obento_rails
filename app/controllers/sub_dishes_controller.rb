class SubDishesController < ApplicationController
    before_action :login_required
    def index
        @sub_dishes = SubDish.all.order(:id)
    end

    def show
        @sub_dish = SubDish.find(params[:id])
    end

    def create
        @sub_dishes=SubDish.all.order(:id)
        if params[:cart].present?
            for i in 1..(params[:cart].length)
                @kosuu = params[:cart][i-1].to_i
                if @kosuu != 0
                    @association=Association.new
                    @association.sub_dish_id=@sub_dishes.ids[i-1]
                    @association.cart_id=current_customer.id
                    @association.num=@kosuu
                    unless @association.save
                        redirect_to sub_dishes_path
                    end
                end
            end
            redirect_to carts_path and return
        end
    end
end
