class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def index
  end

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
      redirect_to user_path(current_user.id)
    else
      render "edit"
    end
  end

  #いいね一覧
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_animal_id)
    @favorite_post_animals = PostAnimal.find(favorites)

    @post_animals = PostAnimal.page(params[:page]).per(8)
  end

  def withdrawal
    @user = User.find(params[:id])
    # is_validカラムをfalesに変更することにより削除フラグを立てる
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
