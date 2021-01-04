class BentosController < ApplicationController
    def index
        if params[:dish]&.size != params[:box].to_i && params[:box].to_i!=0
            redirect_to dishes_path(box: (params[:box]).to_i), notice: "おかずを選択し直してください!"
        elsif params[:dish]&.size == nil
            @bento = Bento.find(params[:box])
        end
        @bento = Bento.find(params[:box])
    end
end
