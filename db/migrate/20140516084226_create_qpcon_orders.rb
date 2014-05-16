class CreateQpconOrders < ActiveRecord::Migration
  def change
    create_table :qpcon_orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :order_id
      t.string :barcode
      t.string :approval_num
      t.integer :is_used
      t.integer :is_expired
      t.integer :is_canceled
      t.integer :valid_end_date
      t.datetime :issue_date

      t.timestamps
    end
  end
end
