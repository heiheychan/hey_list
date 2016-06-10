class PostsController < ApplicationController

  def index
    @category = Category.all
    @posts = get_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(strong_param)
    @post[:category] = Category.find(params[:post][:category]).name

    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def get_post
    posts = Post.all
  end

  def strong_param
    params.require(:post).permit(:category, :sub_category, :price, :title, :content)
  end
end
