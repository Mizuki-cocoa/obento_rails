class BentosController < ApplicationController
    def index
        if params[:dish]&.size != params[:box].to_i && params[:box].to_i!=0
            redirect_to dishes_path(box: (params[:box]).to_i), notice: "おかずを選択し直してください!"
        end
        @bento = Bento.find(params[:box])
    
    end

    def create
        @bento_id=Bento.last.id+1
        @bento=Bento.new
        @bento.id=@bento_id
        @bento.cart_id=current_customer.cart.id
        @bento.box_id=params[:box]
        @bento.num=params[:sum]
        @bb=0
        params[:dish].each do |d|
            @bb+=Dish.find(d).dish_kcal
        end
        @bento.sum_kcal=@bb

        if @bento.save
            params[:dish].each do |d|
                @assignment=Assignment.new
                @assignment.dish_id=d
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
        puts params[:id]
        @bento = Bento.find(params[:id])
        @bento.destroy
        redirect_to :carts, notice: "お弁当を削除しました。"
    end
end
