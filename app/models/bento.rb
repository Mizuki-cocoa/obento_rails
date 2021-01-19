class Bento < ApplicationRecord
    belongs_to :box, class_name: "box", foreign_key: "box_id", optional: true
    belongs_to :cart, class_name: "cart", foreign_key: "cart_id", optional: true
    
    has_many :assignments
    has_many :dishes, through: :assignments
end
