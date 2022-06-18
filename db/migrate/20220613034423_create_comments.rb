class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :admin_id
      t.integer :user_id
      t.integer :post_id
      t.text :comment_text
      t.string :like_count

      t.timestamps
    end
  end
end
