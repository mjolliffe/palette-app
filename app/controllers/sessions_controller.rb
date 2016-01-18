class SessionsController < ApplicationController
  # the code below defines how a session(login/logout) is created or deleted; covered in HARLTL book
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      #if remember me is clicked, remember the user, else forget the user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render '_new'
    end
  end

  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
