class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  
  # フォロー
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー外す
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
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
