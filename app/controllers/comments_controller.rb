class CommentsController < ApplicationController
  def create
    c = Comment.new(strong_params)
    c[:user_id] = current_user.id
    c[:post_id] = params[:id]
    if c.save
      redirect_to post_path(params[:id])
    else
      render post_path(params[:id])
    end
  end

  def destroy
    c = Comment.find(params[:id])
    if c.destroy
      redirect_to post_path(c.post)
    else
      render post_path(c.post)
    end
  end
  private
  def strong_params
    params.require(:comment).permit(:content)
  end
end
