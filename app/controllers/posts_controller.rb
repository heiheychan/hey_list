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
    posts = Post.all
    posts = posts.near(cookies[:search_city], cookies[:search_radius].to_i).order("distance") if !(cookies[:search_city].blank?)
    posts = posts.where("title like ?","%#{params[:keyword]}%") if params[:keyword].present?
    if !(cookies[:search_cat].blank?) && cookies[:search_cat] != "All"
      posts = posts.where("category like ?", "%#{cookies[:search_cat]}%") 
    end
    return posts
  end

  def post_params
    params.require(:post).permit(:category, :sub_category, :price, :title, :content, :address, :price_visible)
  end
end
