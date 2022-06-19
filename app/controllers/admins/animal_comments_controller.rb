class Admins::AnimalCommentsController < ApplicationController
   before_action :authenticate_admin!


  def destroy
    @post_animal = PostAnimal.all
    comment = AnimalComment.find_by(id: params[:id], post_animal: params[:post_animal_id])
    comment.destroy
    redirect_to request.referer
  end
end
