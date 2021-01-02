class Customer < ApplicationRecord
    has_secure_password
    has_many :orders
    has_one :cart

    attr_accessor :current_password
    validates :password, presence: {if: :current_password}

    validates :user_name, presence: true,
    format: {
        with: /\A[A-Za-z][A-Za-z0-9]*\z/,
        allow_blank: true,
        message: :invalid_member_name
    },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }

    validates :full_name, presence: true, length: { maximum: 20}
    validates :address, presence: true, length: { minimum: 2, maximum: 50}

    validates :tel_num, presence: true,
    format: { with: /\A[0-9\-\(\)]+\z/},
    length: { minimum: 8, maximum: 20, allow_blank: true }

    attr_accessor :current_password
    validates :password, presence: {if: :current_password}
    
end
