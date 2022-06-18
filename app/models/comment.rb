class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :post, optional: true
  has_many :likes, dependent: :destroy

  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :reply_comments, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  has_many :comment_like, class_name: 'Like', foreign_key: :comment_id, dependent: :destroy

  def user_favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def admin_favorited_by?(admin)
    likes.where(admin_id: admin.id).exists?
  end
end
