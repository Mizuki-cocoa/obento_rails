class Order < ApplicationRecord
    belongs_to :order, class_name: "Customer", foreign_key: "customer_id"
end
