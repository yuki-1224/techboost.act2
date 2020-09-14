class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topic_path(id: @comment.topic_id)
    else
      redirect_to topic_path(id: params[:topic_id]), danger: "コメントを送信できません"
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id]).destroy
    redirect_to topic_path(id: comment.topic_id), info: "コメントを削除しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end
end
