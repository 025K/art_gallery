class HomesController < ApplicationController
  def top
    @posts = Post.all
    @notice = Post.where(post_genre: 0)
    @illustration = Post.where(post_genre: 1)
    @commic = Post.where(post_genre: 2)
    @goods = Post.where(post_genre: 3)
  end

  private

  def post_params
    params.require(:post).permit(:title, {images: []}, :caption, :post_genre)
  end
end
