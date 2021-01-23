class Admin::DishesController < Admin::Base
    def index
        @dishes = Dish.all.order(:id)
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
            redirect_to [:admin, @dish], notice: "おかずを登録しました。"
        else
            render "new"
        end
    end

    def update
        @dish=Dish.find(params[:id])
        @stock_buffer=@dish.stock
        @dish.(params[:dish])
        @dish.stock=@stock_buffer
        if @dish.save
            redirect_to [:admin, @dish], notice: "おかず情報を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @dish=Dish.find(params[:id])
        @dish.destroy
        redirect_to [:admin, @dish], notice: "おかずを削除しました。"
    end

    def stocks
        @dishes = Dish.all.order(:id)
        if params[:dish].present? && params[:stocksum].present?
            @dishup=Dish.find(params[:dish])
            @current_stock=@dishup.stock
            @dishup.update(stock: @current_stock+params[:stocksum].to_i)
            redirect_to stocks_admin_dishes_path, notice: "おかず量を更新しました"
        end
    end
end
