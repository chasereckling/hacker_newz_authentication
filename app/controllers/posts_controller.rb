class PostsController < ApplicationController
  def index
    @posts = Post.all.order(points: :desc)
    # @current = current_user
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new

  end

  def create
    @user = current_user

    @post = @user.posts.new(post_params)

    if @post.save
      # @post.created_by = current_user.email
      flash[:notice] = "Add successful!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :points)
  end
end
