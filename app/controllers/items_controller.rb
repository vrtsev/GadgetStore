class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category]
      @items = Item.where("category = #{params[:category]}")
    else
      @items = Item.all
    end
  end

  def hot
    @items = Item.all
    render :index
  end

  def newly
    @items = Item.all
    render :index
  end

  def soon
    @items = Item.all
    render :index
  end

  def show
    @items = Item.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :description, :available)
    end
end
