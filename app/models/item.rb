class Item < ApplicationRecord

  has_attached_file :photo, styles: { large: "450x450>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/  
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders
  has_many :comments

	validates :name, presence:true, length: {minimum: 3}
	validates :price, presence:false

end
