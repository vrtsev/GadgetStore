class Cart < ApplicationRecord

  has_and_belongs_to_many :items

  def total_price
    @price = 0
    items.each do |i|
      @price += i.price
    end
    return @price
  end
end
