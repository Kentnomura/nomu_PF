class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?

#ログインしたら

  def after_sign_in_path_for(resource)
    about_path
  end

#ログアウトしたら

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

#メールアドレスを鍵としてもたせる

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
