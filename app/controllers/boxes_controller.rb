class BoxesController < ApplicationController
    before_action :login_required
    def index
        @boxes = Box.all.order(:id)
    end
end
