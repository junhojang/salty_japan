class CreateBoardHelps < ActiveRecord::Migration
  def change
    create_table :board_helps do |t|
      t.string :title
      t.string :dsc

      t.timestamps
    end
  end
end
