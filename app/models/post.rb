class Post < ApplicationRecord
  belongs_to :admin, optional: true
  mount_uploaders :images, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :reply_comments, class_name: 'Comment', foreign_key: :reply, dependent: :destroy

  enum post_genre:{"お知らせ":0, "イラスト":1, "漫画":2, "グッズ":3}
end
