class ChangeWbIdTypeToBigint < ActiveRecord::Migration
  def up
    change_column :wb_users, :wb_id, :bigint, null: false
  end

  def down
    change_column :wb_users, :wb_id, :int, null: false
  end
end
