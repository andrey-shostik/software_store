class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to users_path
    else
      flash[:error] = 'Invalid parameters'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User successfully updated'
      redirect_to users_path
    else
      flash[:error] = 'Invalid parameters'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'User successfully deleted'
    else
      flash[:error] = 'Something wrong'
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :city)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
