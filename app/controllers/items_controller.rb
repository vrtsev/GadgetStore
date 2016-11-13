class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :visited_items

  def index
    if params[:category]
      if params[:position]
        @items = Item.where(category: params[:category], position: params[:position])
      else
        @items = Item.where(category: params[:category] )
      end
      render template: "items/#{params[:category]}"
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
    @comment = Comment.new
    @comments = Comment.all
    @items = Item.all
    @visited_items << @item.id
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

    def visited_items
      session[:visited_items] ||= []
      @visited_items = session[:visited_items].last(4).reverse
      # binding.pry 
      # НЕ ДОДЕЛАНО
    end

end
