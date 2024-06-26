class PostCommentsController < ApplicationController

  def create
    list = List.find(params[:list_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.list_id = list.id
    comment.save
    redirect_to list_path(post_image)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to list_path(params[:list_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
