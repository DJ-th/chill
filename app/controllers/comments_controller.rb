class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params)

    @comment.user_id = current_user.id
    @comment.foodstall_id = params[:foodstall_id]
    if @comment.save
      redirect_to foodstall_path(params[:foodstall_id])
    else
      render 'new'
    end
  end

    private
    def comment_params
      params.require(:comment).permit(:text, :raty)
    end
end
