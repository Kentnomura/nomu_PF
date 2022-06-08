class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @post_animals = @user.post_animals.order(created_at: :desc)
    @post_animals = @user.post_animals.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image)
  end
end
