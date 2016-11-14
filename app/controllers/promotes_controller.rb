class PromotesController < ApplicationController

  def index
    if params[:category]
      @promotes = Promote.where(category: params[:category] )
    else
      @promotes = Promote.all
    end
  end

  def show
    @promote = Promote.find(params[:id])
    @promo_items = @promote.items
  end

end
