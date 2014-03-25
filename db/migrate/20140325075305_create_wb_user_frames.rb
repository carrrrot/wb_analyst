class CreateWbUserFrames < ActiveRecord::Migration
  def change
    create_table :wb_user_frames do |t|
      t.references :wb_user, null: false
      t.integer :followers_count, default: 0, null: false
      t.integer :bi_followers_count, default: 0, null: false
      t.integer :friends_count, default: 0, null: false
      t.integer :statuses_count, default: 0, null: false
      t.integer :favourites_count, default: 0, null: false
      t.float :followers_per_hour
      t.float :bi_followers_per_hour
      t.float :friends_per_hour
      t.float :statuses_per_hour
      t.float :favourites_per_hour
      t.timestamps
    end
    add_index :wb_user_frames, [:wb_user_id, :created_at], unique: true
  end
end
