class Admin::CartsController < ApplicationController

  before_action :set_cart
  layout "admin"

  def index
    @carts = Cart.all
  end

  def show
    @cart = @cart.items
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.id == session[:cart][0]
      session[:cart].clear
    end
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to admin_carts_path, notice: 'Корзина была успешно удалена'}
      format.json { head :no_content }
    end
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

