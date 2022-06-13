class AnimalCommentsController < ApplicationController

  def create
    post_animal = PostAnimal.find(params[:post_animal_id])
    @comment = AnimalComment.new(animal_comment_params)
    @comment.user_id = current_user.id
    @comment.post_animal_id = post_animal.id
    @comment.save
    redirect_to request.referer
  end

  def destroy

    @comment = AnimalComment.find_by(id: params[:id], post_animal: params[:post_animal_id])
    @comment.destroy
    redirect_to  request.referer
  end

  private

  def animal_comment_params
    params.require(:animal_comment).permit(:comment)
  end

end
