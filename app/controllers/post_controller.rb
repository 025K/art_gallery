class PostController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @reply = Comment.new

  end

 private

  def post_params
    params.require(:post).permit(:title, {images: []}, :caption, :post_genre)
  end
end
