class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to home_path(@user)
    else
      render 'new'
    end
  end

  def signin
  end

  def login
    user = User.find_by(username: params[:user][:username])

    if user
      log_in user
      redirect_to home_path(user)
    else
      flash.now[:notice] = 'User not found'
      render 'signin'
    end
  end

  def home
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end
