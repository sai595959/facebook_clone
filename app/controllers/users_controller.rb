class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @followed = @user.followed_users.all
    @follower = @user.followers.all
  end
end
