class CreateAppInfos < ActiveRecord::Migration
  def change
    create_table :app_infos do |t|
      t.integer :time_quick_ans
      t.integer :one_medal
      t.integer :two_medal
      t.integer :test_reward_max
      t.string :android_version
      t.integer :new_stage_day_limit
      t.string :android_package_name
      t.string :market_url

      t.timestamps
    end
  end
end
