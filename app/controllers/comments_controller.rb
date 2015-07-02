class CommentsController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

private
  def comments_params
    params.require(:comment).permit(:text, :author, :points)
  end
end
