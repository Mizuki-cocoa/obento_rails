class Dish < ApplicationRecord
    has_one_attached :dish_picture
    attribute :new_dish_picture
    attribute :remove_dish_picture, :boolean
    has_many :assignments
    has_many :assignment_bentos, through: :assignments, source: :bento

    before_save do
        if new_dish_picture
            self.dish_picture.attach(new_dish_picture)
        elsif remove_dish_picture
            self.dish_picture.purge
        end
    end

    validate if: :new_dish_picture do
        if new_dish_picture.respond_to?(:content_type)
        unless new_dish_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
            errors.add(:new_dish_picture, :invalid_image_type)
        end
        else
            errors.add(:new_dish_picture, :invalid)
        end
    end

    validates :dish_name, presence: true, length: { maximum: 20}
    validates :introduction, presence: true, length: { minimum: 2,  maximum: 20}
    validates :dish_kcal, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 1000,
      allow_blank: true
    }

    validates :stock, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 100,
      allow_blank: true
    }
end
