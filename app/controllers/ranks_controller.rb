class RanksController < ApplicationController

  def index
    # 週間ランキング
    @week_post_animal_favorite_ranks = PostAnimal.find(Favorite.group(:post_animal_id).where(created_at: Time.current.all_week).order('count(post_animal_id) desc').pluck(:post_animal_id))

  end

end
