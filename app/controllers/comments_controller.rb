class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end
  def create
    @foodstall = foodstall.find(params[:foodstall_id])
    Comment.create(comment_params)
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, foodstall_id: params[:foodstall_id])
  end
end
