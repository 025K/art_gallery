class LikesController < ApplicationController
  def create

    post = Post.find(params[:post_id])

    if post.id == nil
     comment = Comment.find(params[:comment_id])
     if current_admin == nil
       like = current_user.likes.new(comment_id: comment.id)
       like.save
       redirect_to post_path(post)
     elsif current_user == nil
       like = current_admin.likes.new(comment_id: comment.id)
       like.save
       redirect_to post_path(post)
     end
    elsif comment == nil
     if current_admin == nil
       like = current_user.likes.new(post_id: post.id)
       like.save
       redirect_to post_path(post)
     elsif current_user == nil
       like = current_admin.likes.new(post_id: post.id)
       like.save
       redirect_to post_path(post)
     end
    end
  end

  def destroy
    post = Post.find(params[:post_id])

    if post.id == nil
     comment = Comment.find(params[:comment_id])
     if current_admin == nil
       like = current_user.likes.find_by(comment_id: comment.id)
       like.destroy
       redirect_to post_path(post)
     elsif current_user == nil
       like = current_admin.likes.find_by(comment_id: comment.id)
       like.destroy
       redirect_to post_path(post)
     end
    elsif comment == nil
     if current_admin == nil
       like = current_user.likes.find_by(post_id: post.id)
       like.destroy
       redirect_to post_path(post)
     elsif current_user == nil
       like = current_admin.likes.find_by(post_id: post.id)
       like.destroy
       redirect_to post_path(post)
     end
    end
  end
end
