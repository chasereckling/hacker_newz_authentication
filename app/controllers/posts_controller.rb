class PostsController < ApplicationController
  def index
    if params[:sort_by] == "points"
      @posts = Post.all.sort_by{|object| [object.points]}.reverse
    elsif params[:sort_by] == "date"
      @posts = Post.all.sort_by{|object| [object.created_at]}.reverse
    else
      @posts = Post.all.sort_by{|object| [object.points, object.created_at]}.reverse
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new

    if current_user
      render :new
    else
      flash[:alert] = "You must be logged in to post!"
      render :index
    end
  end

  def create
    @user = current_user

    @post = @user.posts.new(post_params)

    if @post.save
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
    @posts = Post.all.sort_by{|object| [object.points]}.reverse


    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def upvote
  @post = Post.find(params[:post_id])
  @post.points.create
  redirect_to(posts_path)
end

  private
  def post_params
    params.require(:post).permit(:title, :url, :points)
  end
end
