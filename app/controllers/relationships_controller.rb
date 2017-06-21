class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id]) # 送られてきたパラメータをもとにフォローしたいユーザを取得
    current_user.follow!(@user) # そのユーザーをフォローする
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end
