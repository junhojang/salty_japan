class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name
      t.string :title
      t.string :dsc
      t.integer :category
      t.integer :period
      t.integer :rank
      t.string :img_url
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
