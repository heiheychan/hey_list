class PostsController < ApplicationController
  def index
    @category = Category.all
    @posts = get_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if !(params[:post][:category].empty?)
      @post[:category] = Category.find(params[:post][:category]).name
    end

    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    if Post.find(params[:id]).destroy
      redirect_to root_path
    else
      render post_path(params[:id])
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if !(params[:post][:category].empty?)
      params[:post][:category] = Category.find(params[:post][:category]).name
    end

    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
  def get_post
    if params[:city].present?
      posts = Post.near(params[:city], params[:radius].to_i).order("distance")
      puts posts
    else
      posts = Post.all
    end
    posts
  end

  def post_params
    params.require(:post).permit(:category, :sub_category, :price, :title, :content, :address)
  end
end
