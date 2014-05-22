class CreateAdvertisementCpdms < ActiveRecord::Migration
  def change
    create_table :advertisement_cpdms do |t|
      t.integer :user_id
      t.integer :ad_id
      t.integer :full_time

      t.timestamps
    end
  end
end
