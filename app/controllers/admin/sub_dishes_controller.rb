class Admin::SubDishesController < Admin::Base
    def index
        @sub_dishes = SubDish.all.order(:id)
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
        @stock_buffer=@sub_dish.stock
        @sub_dish.assign_attributes(params[:sub_dish])
        @sub_dish.stock=@stock_buffer
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

    def stocks
        @sub_dishes = SubDish.all.order(:id)
        if params[:sub_dish].present? && params[:stocksum].present?
            @subdish_up=SubDish.find(params[:sub_dish])
            @current_stock=@subdish_up.stock
            @subdish_up.update(stock: @current_stock+params[:stocksum].to_i)
            redirect_to stocks_admin_sub_dishes_path, notice: "サイドメニュー量を更新しました"
        end
    end
end
