class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :nickname
      t.integer :sex
      t.integer :age_group
      t.string :recommend
      t.string :address
      t.string :f_address
      t.string :ph
      t.integer :users_character

      t.timestamps
    end
  end
end
