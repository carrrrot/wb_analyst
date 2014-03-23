class AddFriCountAndVeriTypeToWbUsers < ActiveRecord::Migration
  def up
    change_table :wb_users do |t|
      t.integer :verified_type
      t.integer :friends_count
    end
  end

  def down
    remove_column :wb_users, :verified_type
    remove_column :wb_users, :friends_count
  end
end
