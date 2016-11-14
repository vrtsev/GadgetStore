class Admin::PromotesController < ApplicationController
  before_action :set_promote, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @promotes = Promote.all
  end

  def show
  end

  def new
    @promote = Promote.new
  end

  def create
    @promote = Promote.new(promote_params)

    respond_to do |format|
      if @promote.save
        format.html { redirect_to root_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @promote.update(promote_params)
        format.html { redirect_to root_path, notice: 'Promote was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promote.destroy
    respond_to do |format|
      format.html { redirect_to admin_promotes_url, notice: 'Promo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promote
      @promote = Promote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promote_params
      params.require(:promote).permit(:name, :description, :image, :category)
    end
end
