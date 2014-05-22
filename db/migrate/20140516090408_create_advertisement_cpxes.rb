class CreateAdvertisementCpxes < ActiveRecord::Migration
  def change
    create_table :advertisement_cpxes do |t|
      t.integer :user_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
