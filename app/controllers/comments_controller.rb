class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    if current_admin == nil
      comment.user_id = current_user.id
    elsif current_user == nil
      comment.admin_id = current_admin.id
    end
    comment.post_id = post.id
    comment.save!
    redirect_to post_path(post)
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_text, :post_id, :admin_id, :user_id, :parent_id)
  end
end
