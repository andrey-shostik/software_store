class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        flash[:success] = 'Item successfully created'
        redirect_to items_path
      else
        flash[:error] = 'Invalid parameters'
        render :new
      end
  end

  def update
      if @item.update(item_params)
        flash[:success] = 'Item successfully created'
        redirect_to items_path
      else
        flash[:error] = 'Invalid parameters'
        render :edit
      end
  end

  def destroy
    if @item.destroy
      flash[:success] = 'Item successfully created'
    else
      flash[:error] = 'Something Wrong'
    end
    redirect_to items_path
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :price)
    end
end
