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
      flash.now[:danger] = "Post failed to be created!"
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :image)
  end
end
