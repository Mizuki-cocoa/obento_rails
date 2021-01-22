class SubDish < ApplicationRecord
    has_one_attached :subdish_picture
    attribute :new_subdish_picture
    attribute :remove_subdish_picture, :boolean

    has_many :associations
    has_many :carts, through: :associations

    before_save do
        if new_subdish_picture
            self.subdish_picture.attach(new_subdish_picture)
        elsif remove_subdish_picture
            self.subdish_picture.purge
        end
    end

    validate if: :new_subdish_picture do
        if new_subdish_picture.respond_to?(:content_type)
        unless new_subdish_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
            errors.add(:new_subdish_picture, :invalid_image_type)
        end
        else
            errors.add(:new_subdish_picture, :invalid)
        end
    end

    validates :sub_dish_name, presence: true, length: { maximum: 20}
    validates :sub_dish_price, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 1,
      less_than: 1000,
      allow_blank: true
    }
    validates :introduction, presence: true, length: { minimum: 2,  maximum: 100}
    validates :sub_kcal, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 1000,
      allow_blank: true
    }

    validates :stock, presence: true,
    numericality: {
      only_integer: true,
      greater_than: -1,
      less_than: 100,
      allow_blank: true
    }
end
