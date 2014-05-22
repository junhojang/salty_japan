class CreateRankingWeekBs < ActiveRecord::Migration
  def change
    create_table :ranking_week_bs do |t|
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
