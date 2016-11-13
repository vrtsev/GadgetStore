class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update]

  # GET /comments/new
  def new
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @item, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to root_path }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @item = Item.find(params[:item_id])
      @comment = @item.comments.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :price, :category_id, :available, :photo)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :item_id, :user)
    end
  
end
