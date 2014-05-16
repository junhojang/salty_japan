class CreateLogSignups < ActiveRecord::Migration
  def change
    create_table :log_signups do |t|
      t.integer :user_id
      t.string :dsc
      t.integer :signup_type

      t.timestamps
    end
  end
end
