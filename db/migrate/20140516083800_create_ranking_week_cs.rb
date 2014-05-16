class CreateRankingWeekCs < ActiveRecord::Migration
  def change
    create_table :ranking_week_cs do |t|
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
