class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cart_init


  private

	  def cart_init
      @s = session[:cart] ||= []
      begin
        Cart.find(session[:cart][0])
      rescue ActiveRecord::RecordNotFound
        session[:cart].clear
      end
      if @s.empty?
        @cart = Cart.create
        @s << @cart.id
      end
	  end

	  def calculate_total
	  	s = session[:cart]
	  	total_price = 0
	  	s.each do |item|
	  		total_price += item['price']
	  	end
	  	return total_price
	  end
end
