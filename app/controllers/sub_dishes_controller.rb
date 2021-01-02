class SubDishesController < ApplicationController
    before_action :login_required
    def index
        @sub_dishes = SubDish.all
    end

    def show
        @sub_dish = SubDish.find(params[:id])
    end
end
