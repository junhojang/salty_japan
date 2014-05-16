class CreateQpconProducts < ActiveRecord::Migration
  def change
    create_table :qpcon_products do |t|
      t.integer :category_id
      t.string :name
      t.string :change_market
      t.integer :stock_cnt
      t.integer :market_cost
      t.integer :common_cost
      t.integer :min_age
      t.string :use_info
      t.integer :valid_type
      t.integer :valid_date
      t.integer :min_sale_cnt
      t.integer :max_sale_cnt
      t.integer :mon_max_sale_cnt
      t.integer :sale_gb
      t.integer :prod_gb
      t.integer :pin_type
      t.string :img_url_70
      t.string :img_url_150
      t.string :img_url_250

      t.timestamps
    end
  end
end
