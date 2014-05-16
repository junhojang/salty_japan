class CreateLogCpdms < ActiveRecord::Migration
  def change
    create_table :log_cpdms do |t|
      t.integer :user_id
      t.integer :ad_id
      t.integer :act
      t.string :dsc
      t.integer :view_time

      t.timestamps
    end
  end
end
