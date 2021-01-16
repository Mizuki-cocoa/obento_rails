class AssociationsController < ApplicationController
  def destroy
    @association = Association.find(params[:id])
    @association.destroy
    redirect_to :carts, notice: "サイドメニューを削除しました。"
  end
end
