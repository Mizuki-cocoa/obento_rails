class Admin::SubDishesController < Admin::Base
    def index
        @sub_dishes = SubDish.all
    end

    def show
        @sub_dish = SubDish.find(params[:id])
    end

    def new
        @sub_dish = SubDish.new()
    end

    def edit
        @sub_dish = SubDish.find(params[:id])
    end

    def create
        @sub_dish = SubDish.new(params[:sub_dish])
        if @sub_dish.save
            redirect_to [:admin, @sub_dish], notice: "サイドメニューを登録しました。"
        else
            render "new"
        end
    end

    def update
        @sub_dish=SubDish.find(params[:id])
        @sub_dish.assign_attributes(params[:sub_dish])
        if @sub_dish.save
            redirect_to [:admin, @sub_dish], notice: "サイドメニュー情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @sub_dish=SubDish.find(params[:id])
        @sub_dish.destroy
        redirect_to [:admin, @sub_dish], notice: "サイドメニューを削除しました。"
    end
end