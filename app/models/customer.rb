class Customer < ApplicationRecord
    has_secure_password
    has_many :orders
    attr_accessor :current_password
    validates :password, presence: {if: :current_password}
end
