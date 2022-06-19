class Admins::PostAnimalsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @post_animals = PostAnimal.all.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @post_animal = PostAnimal.find(params[:id])
    @animal_comment = AnimalComment.new
  end

  def destroy
    @post_animal = PostAnimal.find(params[:id])
    @post_animal.destroy
    redirect_to admins_post_animals_path
  end
end
