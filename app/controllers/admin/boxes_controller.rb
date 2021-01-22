class Admin::BoxesController < ApplicationController
  before_action :admin_login_required
  def index
    @boxes = Box.order("id")
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
    @box = Box.new(box_params)
    if @box.save
      redirect_to admin_boxes_path, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def update
    @box = Box.find(params[:id])
    @box.assign_attributes(box_params)
    if @box.save
      redirect_to [:admin, @box], notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    redirect_to admin_boxes_path, notice: "会員を削除しました。"
  end

  # ストロング・パラメータ
  private def box_params
    params.require(:box).permit(
      :new_profile_picture,
      :remove_profile_picture,
      :box_name,
      :box_price
    )
  end
end
