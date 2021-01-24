class Dish < ApplicationRecord
    has_one_attached :dish_picture
    attribute :new_dish_picture
    attribute :remove_dish_picture, :boolean
    has_many :assignments
    has_many :bentos, through: :assignments

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
    validates :introduction, presence: true, length: { minimum: 2,  maximum: 100}
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
        greater_than: -1,
        less_than: 100,
        allow_blank: true
    }

    class << self
        def search(down,up)
        if up.present? && down.present? && up.to_i-down.to_i>0
            rel = order("dish_kcal")
            rel=rel.where(dish_kcal: down.to_i..up.to_i).order("dish_kcal")
            up.to_i-down.to_i
        end
            rel
        end

        def search1(query)
            rel = order("dish_kcal")
            if query.present?
                rel = rel.where("dish_name LIKE ?", "%#{query}%")
            end
                rel
        end
    end
end
