class CreateLikeNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :like_notices do |t|
      t.integer :like_id
      t.integer :notice_from
      t.integer :notice_to
      t.boolean :notice_status

      t.timestamps
    end
  end
end
