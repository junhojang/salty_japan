class CreateLogTests < ActiveRecord::Migration
  def change
    create_table :log_tests do |t|
      t.integer :user_id
      t.integer :test_type
      t.integer :category
      t.integer :stage
      t.integer :level
      t.integer :medal_num
      t.integer :score
      t.integer :reward
      t.integer :point
      t.string :dsc
      t.integer :is_first

      t.timestamps
    end
  end
end
