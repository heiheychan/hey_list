class ImagesController < ApplicationController
  before_action :set_post

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @post.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @post.save
    redirect_to edit_post_path(params[:post_id])
  end

  private

  def set_post
    post_id = params[:post_id].to_i
    @post = Post.find(post_id)
  end

  def add_more_images(new_images)
    images = @post.images 
    images += new_images
    @post.images = images
  end

  def remove_image_at_index(index)
    remain_images = @post.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    if @post.images.empty?
      @post.update_attributes(:images => nil)
    else
      @post.images = remain_images # re-assign back
    end 
  end

  def images_params
    params.require(:post).permit({images: []}) # allow nested params as array
  end
end
