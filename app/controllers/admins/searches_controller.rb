class Admins::SearchesController < ApplicationController
  def search
    @search = params[:search]
    @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
  end
end
