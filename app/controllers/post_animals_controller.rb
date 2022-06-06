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
  end

  def show
  end

  private

  def post_animal_params
    params.require(:post_animal).permit(:image, :caption)
  end
end
