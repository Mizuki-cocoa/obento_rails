class Order < ApplicationRecord
    belongs_to :order, class_name: "Customer", foreign_key: "customer_id"
    has_many :order_bentos
    has_many :order_subdishes
end