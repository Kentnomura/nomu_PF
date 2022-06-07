class PostAnimalsController < ApplicationController

  def new
    @post_animal = PostAnimal.new
  end

  def create
    @post_animal = PostAnimal.new(post_animal_params)
    @post_animal.user_id = current_user.id
    if @post_animal.save
      redirect_to post_animals_path
    else
      render "new"
    end
  end

  def index
    @post_animals = PostAnimal.all
  end

  def show
    @post_animal = PostAnimal.find(params[:id])
  end

  def edit
  end

  def destroy
    @post_animal = PostAnimal.find(params[:id])
    @post_animal.destroy
    redirect_to post_animals_path
  end

  private

  def post_animal_params
    params.require(:post_animal).permit(:image, :caption)
  end
end
