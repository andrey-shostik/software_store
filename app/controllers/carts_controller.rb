class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    if User.find_by(id: cart_params['user_id']) && @cart.save
      flash[:success] = 'Cart successfully created'
      redirect_to carts_path
    else
      flash[:error] = 'Invalid parameters'
      render :new
    end
  end

  def show
    @cart = Item.find(params[:id])
  end

  def update
    if User.find_by(id: cart_params['user_id']) && @cart.update(cart_params)
      flash[:success] = 'Cart successfully created'
      redirect_to carts_path
    else
      flash[:error] = 'Invalid parameters'
      render :edit
    end
  end

  def destroy
    if @cart.destroy
      flash[:success] = 'Cart successfully created'
    else
      flash[:error] = 'Something Wrong'
    end
    redirect_to carts_path
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
