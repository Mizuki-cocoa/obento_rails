class Dish < ApplicationRecord
    has_one_attached :dish_picture
    attribute :new_dish_picture
    attribute :remove_dish_picture, :boolean

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
end
