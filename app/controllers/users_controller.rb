class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User successfully created and logged in!'
    else
      flash.now[:alert] = 'Error creating user. Please check the form.'
      render :new
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      redirect_to root_path, notice: 'User successfully logged in!'
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
