class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'guestuserでログインしました。'
  end

  def reject_inactive_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_session_path
      end
    end
  end

end