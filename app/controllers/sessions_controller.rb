class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      flash[:success] = 'Session successfully created'
      session[:current_user_id] = @user.token
      redirect_to root_path
    else
      flash[:error] = 'Invalid parameters'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
