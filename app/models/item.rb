class Item < ApplicationRecord

  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders
  has_many :comments

	validates :name, presence:true, length: {minimum: 3}
	validates :price, presence:false

end
