class CommentsController < ApplicationController
def new
  @comment = Comment.new
end

 def create  
  #@foodstall = Foodstall.find(params[:foodstall_id])
  @comment = Comment.new
  comment = Comment.new(comment_params)
  if @comment.save
    redirect_to foodstall_path(:id)
else
  render :create
  end
 end
  

  private
  def comment_params
    params.require(:comment).permit(:title, :text).merge(user_id: current_user.id, foodstall_id: params[:foodstall_id])
  end
end
