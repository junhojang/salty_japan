class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :user_id
      t.string :name
      t.string :bank
      t.string :account
      t.integer :process_status
      t.integer :amount

      t.timestamps
    end
  end
end
