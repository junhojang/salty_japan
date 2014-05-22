class CreateLearningProgresses < ActiveRecord::Migration
  def change
    create_table :learning_progresses do |t|
      t.integer :user_id
      t.integer :daily_test_cnt
      t.integer :current_reward
      t.integer :total_reward
      t.datetime :last_tested_at

      t.timestamps
    end
  end
end
