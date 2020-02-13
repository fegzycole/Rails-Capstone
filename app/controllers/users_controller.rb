class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.reload

      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @opinions = Opinion.get_users_posts(params[:id])
    @followers = User.user_followers(params[:id], current_user.id)
  end

  def signin
  end

  def login
    user = User.find_by(Username: params[:user][:Username])

    if user
      log_in user
      redirect_to root_path
    else
      flash.now[:notice] = 'User not found'
      render 'signin'
    end
  end

  def destroy
    sign_out if logged_in?
    redirect_to sign_in_path
  end

  private

  def user_params
    params.require(:user).permit(:Username, :Fullname, :Photo, :CoverImage)
  end
end
