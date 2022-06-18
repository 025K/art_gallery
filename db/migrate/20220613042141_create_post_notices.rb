class CreatePostNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :post_notices do |t|
      t.integer :Post_id
      t.integer :notice_to
      t.boolean :notice_status

      t.timestamps
    end
  end
end
