class FavoritesController < ApplicationController

  def create
    post_animal = PostAnimal.find(params[:post_animal_id])
    favorite = current_user.favorites.new(post_animal_id: post_animal.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post_animal = PostAnimal.find(params[:post_animal_id])
    favorite  = current_user.favorites.find_by(post_animal_id: post_animal.id)
    favorite.destroy
    redirect_to request.referer
  end

end
