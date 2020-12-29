class Order < ApplicationRecord
    belongs_to :orderman, class_name: "Customer", foreign_key: "customer_id"
end
