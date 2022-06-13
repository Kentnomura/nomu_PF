class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search = params[:search]
    @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
  end
end
