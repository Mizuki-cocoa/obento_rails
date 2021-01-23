class Admin::BoxesController < Admin::Base
    before_action :admin_login_required
    def index
        @boxes = Box.order("box_num")
    end

    def show
        @box = Box.find(params[:id])
    end

    def new
        @box = Box.new()
    end

    def edit
        @box = Box.find(params[:id])
    end

    def create
        @box = Box.new(params[:box])
        if @box.save
            redirect_to admin_boxes_path, notice: "弁当箱を登録しました。"
        else
            render "new"
        end
    end

    def update
        @box = Box.find(params[:id])
        if @box.save
            redirect_to admin_boxes_path, notice: "弁当箱を更新しました。"
        else
            render "edit"
        end
    end

    def destroy
        @box = Box.find(params[:id])
        @box.destroy
        redirect_to admin_boxes_path, notice: "弁当箱を削除しました。"
    end
end
