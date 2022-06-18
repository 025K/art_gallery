class Post < ApplicationRecord
  belongs_to :admin, optional: true
  mount_uploaders :images, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :reply_comments, class_name: 'Comment', foreign_key: :reply, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum post_genre:{"お知らせ":0, "イラスト":1, "漫画":2, "グッズ":3}

  def user_favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def admin_favorited_by?(admin)
    likes.where(admin_id: admin.id).exists?
  end
end
