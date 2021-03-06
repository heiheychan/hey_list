class PostsController < ApplicationController
  def index
    @category = Category.all
    @posts = get_search_results
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params) 
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
    @post = Post.find_by_id(params[:id])
    if current_user
      @comment = current_user.comments.build
    end
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
  def get_search_results
    posts = Post.all
    if cookies[:search_cat].blank?
      posts = posts.near(request.location.city, 20).order("distance")
    else
      posts = posts.near(cookies[:search_city], cookies[:search_radius].to_i).order("distance") if !(cookies[:search_city].blank?)
      posts = posts.where("title like ?","%#{params[:keyword]}%") if params[:keyword].present?
      if !(cookies[:search_cat].blank?) && cookies[:search_cat] != "All"
        posts = posts.where("category like ?", "%#{cookies[:search_cat]}%") 
      end
    end
    return posts.order("created_at DESC")
  end

  def post_params
    params.require(:post).permit(:category, :sub_category, :price, :title, :content, :address, :price_hide, {images: []})
  end
end
