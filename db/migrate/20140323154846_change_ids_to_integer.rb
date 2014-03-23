class ChangeIdsToInteger < ActiveRecord::Migration
  def up
    change_column :wb_competitions, :wb_user_id, :integer
    change_column :wb_competitions, :wb_competitor_id, :integer
  end

  def down
    change_column :wb_competitions, :wb_user_id, :string
    change_column :wb_competitions, :wb_competitor_id, :string
  end
end
