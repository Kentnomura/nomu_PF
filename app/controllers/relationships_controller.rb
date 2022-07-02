class RelationshipsController < ApplicationController
  before_action :authenticate_user!


  # フォロー
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user.id)
  end

  # フォロー外す
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user.id)
  end

  # フォロー　一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  # フォロワー　一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
