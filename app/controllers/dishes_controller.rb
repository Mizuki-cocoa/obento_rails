class DishesController < ApplicationController
    before_action :login_required
    def index
        @dishes = Dish.all.order(:id)
    end

    def show
        @dish = Dish.find(params[:id])
    end

    def search
        @dishes = Dish.search(params[:q],params[:downkcal],params[:upkcal])
        flash.alert=@message
        render "index"
    end
end
