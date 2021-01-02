class DishesController < ApplicationController
    before_action :login_required
    def index
        @dishes = Dish.all
    end

    def show
        @dish = Dish.find(params[:id])
    end
end
