class BentosController < ApplicationController
    def index
        if params[:dish]&.size != params[:sum].to_i && params[:sum].to_i!=0
            redirect_to dishes_path(box: (params[:sum]).to_i), notice: "おかずを選択し直してください!"
        elsif params[:dish]&.size == nil
            @bentos = Bento.all
        end
        @bentos = Bento.all
    end
end
