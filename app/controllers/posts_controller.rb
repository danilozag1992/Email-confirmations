class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Post failed to be created!"
      render 'new'
    end
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post is Updated"
    else
      flash[:alert] = 'Post is not updated'
    end
  end
  def edit
  end
  def destroy
    @post.destroy
    flash.now[:notice] = 'Practice is deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :image)
  end
end
