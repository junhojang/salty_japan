class CreateLogFbSharings < ActiveRecord::Migration
  def change
    create_table :log_fb_sharings do |t|
      t.integer :user_id
      t.integer :info_id
      t.string :dsc

      t.timestamps
    end
  end
end
