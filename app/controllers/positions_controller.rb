class PositionsController < ApplicationController
  before_action :set_position, only: [:edit, :update, :destroy]

  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def edit
  end

  def create
    @position = Position.new(position_params)
    if Item.find_by(id: position_params['item_id']) && Cart.find_by(id: position_params['cart_id']) && @position.save
      flash[:success] = 'Position successfully created'
      redirect_to positions_path
    else
      flash[:error] = 'Invalid parameters'
      render :new
    end
  end

  def update
    if Item.find_by(id: position_params['item_id']) && Cart.find_by(id: position_params['cart_id']) && @position.update(position_params)
      flash[:success] = 'Position successfully updated'
      redirect_to positions_path
    else
      flash[:error] = 'Invalid parameters'
      render :edit
    end
  end

  def destroy
    if @position.destroy
      flash[:success] = 'Position successfully deleted'
    else
      flash[:error] = 'Something wrong'
    end
    redirect_to positions_path
  end

  private

  def position_params
    params.require(:position).permit(:cart_id, :item_id)
  end

  def set_position
    @position = Position.find(params[:id])
  end
end
