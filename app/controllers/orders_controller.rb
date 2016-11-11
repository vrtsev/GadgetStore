class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @cart = Cart.find(@s[0])
    @items = Cart.find(@s[0]).items
    @total = @cart.total_price
    @order = Order.new
  end

  def create
    @cart = Cart.find(@s[0])
    @order = Order.new(order_params)
    @order.total_price = @cart.total_price
    @cart = Cart.find(@s[0])
    @order.items << @cart.items  

    respond_to do |format|
      if @order.save
        @cart.items.delete_all
        format.html { redirect_to root_path, notice: 'Благодарим Вас за заказ. Наш менеджмер обязательно свяжется с Вами в ближайшее время' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:city, :phone, :fullname, :email, :delivery_method, :pay_method, :order_comment, :status, :total_price)
    end
end
