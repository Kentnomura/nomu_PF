class Admins::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #投稿順変えるための記述と、ページネーションの記述が一緒になっている
    @post_animals = @user.post_animals.order(created_at: :desc).page(params[:page]).per(6)
  end

end
