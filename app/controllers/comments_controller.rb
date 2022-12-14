class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
