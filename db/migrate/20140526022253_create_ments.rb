class CreateMents < ActiveRecord::Migration
  def change
    create_table :ments do |t|
      t.integer :type
      t.string :ment

      t.timestamps
    end
  end
end
