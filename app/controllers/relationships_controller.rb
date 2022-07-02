class RelationshipsController < ApplicationController
  before_action :authenticate_user!


  # フォロー
  def create
    @user = current_user.follow(params[:user_id])
    #@post_animal = PostAnimal.find_by(@user)
    #redirect_to request.referer
  end

  # フォロー外す
  def destroy
    @user = current_user.unfollow(params[:user_id])
    #@post_animal = PostAnimal.find(params[:id])
    #redirect_to request.referer
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
