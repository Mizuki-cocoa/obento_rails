class Association < ApplicationRecord
    belongs_to :cart, optional: true
    belongs_to :sub_dish
end
