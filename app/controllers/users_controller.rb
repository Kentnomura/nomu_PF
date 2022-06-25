class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :unsubscribe]
  before_action :ensure_correct_user, only: [:edit, :update, :unsubscribe]



  def show
    @user = User.find(params[:id])
    #投稿順変えるための記述と、ページネーションの記述が一緒になっている
    @post_animals = @user.post_animals.order(created_at: :desc).page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  #いいね一覧
  def favorites
    @user = User.find(params[:id])
    @favorite_post_animals = @user.favorite_animals.page(params[:page]).per(8).order(created_at: :desc)
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_validカラムをfalesに変更することにより退会フラグを立てる
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理しました"
    redirect_to root_path
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはアカウント編集ができません。'
    end
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), notice: "他のアカウントは編集できません"
    end
  end

end
