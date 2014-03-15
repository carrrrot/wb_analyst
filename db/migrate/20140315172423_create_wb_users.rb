class CreateWbUsers < ActiveRecord::Migration
  def change
    create_table :wb_users do |t|
      t.integer :wb_id, null: false
      t.string :screen_name
      t.string :name, null: false
      t.string :province
      t.string :city
      t.string :location
      t.string :description
      t.string :url
      t.string :profile_image_url
      t.string :domain
      t.string :gender
      t.integer :followers_count
      t.integer :statuses_count
      t.integer :favourites_count
      t.datetime :joined_at
      t.boolean :verified
      t.string :avatar_large
      t.string :verified_reason
      t.integer :bi_followers_count
      t.string :lang

      t.timestamps
    end
    add_index :wb_users, :wb_id, unique: true
  end
end
