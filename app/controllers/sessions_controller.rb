class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :login]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to sessions_new_path
    end
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #redirect_to sessions_home_page_path
      redirect_to clock_events_path
    else
      redirect_to sessions_new_path
    end
  end

  def logout
    reset_session
    flash[:notice] = "You have been logging out!!"
    redirect_to sessions_welcome_path
  end

  def welcome
  end

  def home_page
  end
end
