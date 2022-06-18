class Admin::PostController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id
    @post.save
    redirect_to "/post/#{@post.id}"
  end

  def index
  end

  def show
  end

  def destroy
  end

 private

  def post_params
    params.require(:post).permit(:title, {images: []}, :caption, :post_genre)
  end
end
