class DishesController < ApplicationController
    before_action :login_required
    def index
        @dishes = Dish.all.order(:id)
    end

    def show
        @dish = Dish.find(params[:id])
    end

    def search
        if params[:q].present?
            @dishes = Dish.search1(params[:q])
        end

        if params[:downkcal].present? && params[:upkcal].present?
            @dishes = Dish.search(params[:downkcal], params[:upkcal])
        end
        render "index"
    end
end
