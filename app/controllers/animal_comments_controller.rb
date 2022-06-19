class AnimalCommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    @post_animal = PostAnimal.find(params[:post_animal_id])
    @comment = AnimalComment.new(animal_comment_params)
    @comment.user_id = current_user.id
    @comment.post_animal_id = @post_animal.id
    @comment.save
    @animal_comment = AnimalComment.new
  end

  def destroy
    @post_animal = PostAnimal.all
    @comment = AnimalComment.find_by(id: params[:id], post_animal: params[:post_animal_id])
    @comment.destroy
    @animal_comment = AnimalComment.new
  end

  private

  def animal_comment_params
    params.require(:animal_comment).permit(:comment)
  end

end
