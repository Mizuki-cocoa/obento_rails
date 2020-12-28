class DishesController < ApplicationController
    def index
        @dishes = Dish.all
    end

    def show
        @dish = Dish.find(params[:id])
    end

    def new
        @dish = Dish.new()
    end

    def edit
        @dish = Dish.find(params[:id])
    end

    def create
        @dish = Dish.new(params[:dish])
        if @dish.save
            redirect_to @dish, notice: "おかずを登録しました。"
        else
            render "new"
        end
    end

    def update
        @dish=Dish.find(params[:id])
        @dish.assign_attributes(params[:dish])
        if @dish.save
            redirect_to @dish, notice: "おかず情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @dish=Dish.find(params[:id])
        @dish.destroy
        redirect_to :dishes, notice: "おかずを削除しました。"
    end
end
