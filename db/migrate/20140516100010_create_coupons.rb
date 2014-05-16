class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :ad_id
      t.string :name
      t.string :company
      t.string :dsc
      t.string :img_url
      t.datetime :valid_start_date
      t.datetime :valid_end_date

      t.timestamps
    end
  end
end
