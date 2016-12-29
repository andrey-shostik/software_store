class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = 'Order successfully created'
      redirect_to orders_path
    else
      flash[:error] = 'Invalid parameters'
      render :new
    end
  end

  def update
    if @order.update(order_params)
      flash[:success] = 'Order successfully updated'
      redirect_to orders_path
    else
      flash[:error] = 'Invalid parameters'
      render :edit
    end
  end

  def destroy
    if @order.destroy
      flash[:success] = 'Order successfully deleted'
    else
      flash[:error] = 'Something wrong'
    end
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
