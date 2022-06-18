class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :comment_id
      t.integer :user_id
      t.integer :admin_id
      t.integer :post_id
      t.integer :partner_id
      t.string :count

      t.timestamps
    end
  end
end
