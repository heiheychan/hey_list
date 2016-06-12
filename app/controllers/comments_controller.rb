class CommentsController < ApplicationController
  def create
    post = Post.find(params[:id])
    @comment = post.comments.new(strong_params)
    if @comment.save
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
