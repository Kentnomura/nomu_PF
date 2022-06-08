class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @post_animals = @user.post_animals
  end

  def edit
  end
end
