class CreateUserBestScores < ActiveRecord::Migration
  def change
    create_table :user_best_scores do |t|
      t.integer :user_id
      t.integer :stage_id
      t.integer :best_score
      t.integer :medals_num

      t.timestamps
    end
  end
end
