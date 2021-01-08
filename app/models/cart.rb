class Cart < ApplicationRecord
    belongs_to :customer, class_name: "customer", foreign_key: "customer_id", optional: true
    has_many :bentos

    has_many :associations
    has_many :sub_dishes, through: :associations
end