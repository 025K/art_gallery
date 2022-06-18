class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :post, optional: true

  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :reply_comments, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
end
