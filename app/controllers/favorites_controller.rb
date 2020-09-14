class FavoritesController < ApplicationController
  def index
    @favote_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    if favorite.save
      redirect_to topics_path
    else
      redirect_to topics_path, danger: 'いいねできません'
    end
  end

  def destroy
    favorite = Favorite.find_by(topic_id: params[:topic_id], user_id: current_user.id)
    favorite.destroy
    redirect_to topics_path
  end
end
