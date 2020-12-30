class SubDish < ApplicationRecord
    has_one_attached :subdish_picture
    attribute :new_subdish_picture
    attribute :remove_subdish_picture, :boolean

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
end
