class CreateWbCompetitions < ActiveRecord::Migration
  def change
    create_table :wb_competitions do |t|
      t.string :wb_user_id, null: false
      t.string :wb_competitor_id, null: false
      t.timestamps
    end
    add_index :wb_competitions, [:wb_user_id, :wb_competitor_id], unique: true
  end
end
