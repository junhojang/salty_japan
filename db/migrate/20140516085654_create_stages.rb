class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :level_id
      t.integer :stage_num

      t.timestamps
    end
  end
end
