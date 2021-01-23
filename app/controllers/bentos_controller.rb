class BentosController < ApplicationController
    before_action :login_required
    def index
        @num=Box.find(params[:box]).box_num
        if params[:dish]&.size != @num && params[:box]!=0
            redirect_to dishes_path(box: (params[:box]).to_i), notice: "おかずを選択し直してください!"
        end
    end

    def create
        @bento_id=Bento.last.id+1
        @bento=Bento.new
        @bento.id=@bento_id
        @bento.cart_id=current_customer.cart.id
        @bento.box_id=params[:box]
        @bento.num=params[:sum]
        @disharray=params[:dish]
        @bb=0
        p @disharray

        @disharray.each do |d|
            @bb+=Dish.find(d.to_i).dish_kcal
        end

        @bento.sum_kcal=@bb

        if @bento.save
            @disharray.each do |d|
                @assignment=Assignment.new
                @assignment.dish_id=d.to_i
                @assignment.bento_id=@bento_id
                unless @assignment.save
                    redirect_to boxes_path
                end
            end
            redirect_to carts_path
        else
            redirect_to boxes_path
        end
    end

    def destroy
        @bento = Bento.find(params[:id])
        @bento.destroy
        redirect_to :carts, notice: "お弁当を削除しました。"
    end
end
