class UsersController < ApplicationController
  include AuthenticationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_users_path, notice: 'User successfully created. Please log in!'
    else
      flash.now[:alert] = 'Error creating user. Please check the form.'
      render :new
    end
  end

  def login
    @user = User.new
  
    user = authenticate_user(params[:username], params[:password])
  
    if user
      session[:user_id] = user.id
      redirect_to landing_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :new
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def authenticate_user(username, password)
    user = User.find_by(username: username)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
