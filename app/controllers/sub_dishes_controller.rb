class SubDishesController < ApplicationController
    def index
        @sub_dishes = SubDish.all
    end
end
