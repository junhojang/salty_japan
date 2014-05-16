class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.integer :client_id
      t.string :name
      t.integer :ad_type
      t.integer :contract
      t.integer :remain
      t.integer :pay_type
      t.string :url
      t.integer :priority
      t.string :dsc
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
