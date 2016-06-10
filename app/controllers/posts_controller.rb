class PostsController < ApplicationController

  def index
    @category = Category.all
    @posts = get_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def get_post
    posts = Post.all
  end
end
