class CreateAdvertisementCpds < ActiveRecord::Migration
  def change
    create_table :advertisement_cpds do |t|
      t.integer :user_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
