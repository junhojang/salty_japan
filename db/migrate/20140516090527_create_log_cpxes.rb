class CreateLogCpxes < ActiveRecord::Migration
  def change
    create_table :log_cpxes do |t|
      t.integer :user_id
      t.integer :ad_id
      t.integer :act
      t.string :dsc

      t.timestamps
    end
  end
end
