﻿class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order(created_at: :desc)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart_id = session[:cart]
  end

  # GET /orders/new
  def new
    @total = calculate_total
    @cart = session[:cart]
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    binding.pry
    @s = session[:cart]
    @s.each { |i| @order.items << Item.find(i['id']) }

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Благодарим Вас за заказ. Наш менеджмер обязательно свяжется с Вами в ближайшее время' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
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
