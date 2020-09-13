class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_parems)

    if @topic.save
      redirect_to topics_path, succes: '投稿しました'
    else
      flash.now[:danger] = "投稿できません"
      render :new
    end
  end

  private
  def topic_parems
    params.require(:topic).permit(:image, :description)
  end
end
