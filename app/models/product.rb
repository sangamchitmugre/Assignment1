class Product < ApplicationRecord
	has_many :order_items
	default_scope { where(active: true) }
    validates :name, presence: true
    validates  :brand_name, presence: true
    validates  :url, presence: true
    validates  :price, presence: true
    validates  :quantity, presence: true

end



