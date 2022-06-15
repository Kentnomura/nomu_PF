class Admins::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #投稿順変えるための記述と、ページネーションの記述が一緒になっている
    @post_animals = @user.post_animals.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_users_path
    else
      @users = User.all
      render "edit"
    end
  end

  private

  def user_params
     params.require(:user).permit(:name, :is_valid)
  end

end
