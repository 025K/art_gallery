class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :image_id
      t.text :title
      t.text :caption
      t.integer :admin_id
      t.boolean :is_release
      t.string :post_count
      t.string :like_count

      t.timestamps
    end
  end
end
