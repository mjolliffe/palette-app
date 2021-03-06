class UsersController < ApplicationController
# only a logged in user can view the users index page and edit or update their info
before_action :logged_in_user, only: [:index, :edit, :update]
before_action :correct_user,   only: [:edit, :update]

  # lists out all of the users of palette
  def index
    if params[:query] && params[:search]
      search_by = params[:search].to_sym
      query = params[:query]
      user_list = User.all
      @users = []
      user_list.each do |user|
        if user[search_by].to_s.downcase.include? params[:query].to_s.downcase
          @users << user
        end
      end
    else
      @users = User.all
    end
  end

  # shows individual user pages
  def show
    if params[:commit] == "next user"
        user = User.find(params[:id].to_i + 1)
        redirect_to user_path(user)
    elsif params[:commit] == "prev user"
        user = User.find(params[:id].to_i - 1)
        redirect_to user_path(user)
    else
        @user = User.find(params[:id])
    end
  end

  # allows a new user to sign up to palette
  def new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Palette!"
      redirect_to @user
    else
      flash[:danger] = "Please try signing up again."
      redirect_to :back
    end
  end

  # allows a user to edit their user info
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

  # defines who the current user is
  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

private
  def user_params
  # defines the params needed to create a new user
    params.require(:user).permit(:name, :email, :zip_code, :description, :password, :password_confirmation)
  end
end
