class BoxesController < ApplicationController
    def index
        @boxes = Box.all
    end
end
