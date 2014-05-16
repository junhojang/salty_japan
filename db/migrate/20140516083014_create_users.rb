class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :f_email
      t.string :password_digest
      t.integer :join_method
      t.integer :is_active
      t.integer :is_admin

      t.timestamps
    end
  end
end
