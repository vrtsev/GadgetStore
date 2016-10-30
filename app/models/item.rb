class Item < ApplicationRecord

	has_and_belongs_to_many :carts

	validates :name, presence:true, length: {minimum: 3}
	validates :price, allow_nil: true

end
