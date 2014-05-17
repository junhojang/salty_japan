class CreateRankingCurrents < ActiveRecord::Migration
  def change
    create_table :ranking_currents do |t|
      t.integer :user_id
      t.integer :week_a
      t.integer :week_b
      t.integer :week_c
      t.integer :week_d

      t.timestamps
    end
  end
end
