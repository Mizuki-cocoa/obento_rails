class Box < ApplicationRecord
    has_one_attached :box_picture
    attribute :new_box_picture
    attribute :remove_box_picture, :boolean
    has_many :bentos

    before_save do
        if new_box_picture
            self.box_picture.attach(new_box_picture)
        elsif remove_box_picture
            self.box_picture.purge
        end
    end

    validate if: :new_box_picture do
        if new_box_picture.respond_to?(:content_type)
        unless new_box_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
            errors.add(:new_box_picture, :invalid_image_type)
        end
        else
            errors.add(:new_box_picture, :invalid)
        end
    end

    validates :box_num, presence: true, length: {maximum: 20}
    validates :box_name, presence: true, length: { minimum: 2,  maximum: 20}
    validates :box_price, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 5000,
      allow_blank: true
    }
end
