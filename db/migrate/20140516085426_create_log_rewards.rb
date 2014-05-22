class CreateLogRewards < ActiveRecord::Migration
  def change
    create_table :log_rewards do |t|
      t.integer :user_id
      t.integer :reward_type
      t.integer :amount
      t.string :dsc

      t.timestamps
    end
  end
end
