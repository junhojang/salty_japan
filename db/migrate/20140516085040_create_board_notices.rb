class CreateBoardNotices < ActiveRecord::Migration
  def change
    create_table :board_notices do |t|
      t.string :title
      t.string :dsc
      t.integer :notice_type

      t.timestamps
    end
  end
end
