class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :category_id
      t.integer :level_num

      t.timestamps
    end
  end
end
