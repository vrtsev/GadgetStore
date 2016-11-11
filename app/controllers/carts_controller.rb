class CartsController < ApplicationController

  before_action :set_cart

  def show
    @items = @cart.items
  end

  def add_to_cart
    @item = Item.find(params[:id])
    @cart.items << @item
    respond_to do |format|
      format.html { redirect_to @item, notice: 'Item was successfully created.' }
    end
  end

  def remove_from_cart
    @item = Item.find(params[:id])
    @cart.items.delete @item
    respond_to do |format|
      format.html { redirect_to '/cart', notice: 'Item was successfully deleted from cart.' }
    end
  end

  def clear
    @cart.items.delete_all
    redirect_to "/cart"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(@s[0])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:id)
    end
end

