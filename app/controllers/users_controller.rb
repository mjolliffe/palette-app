class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Palette!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :zip_code, :description, :password, :password_confirmation)
  end
end
