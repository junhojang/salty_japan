class CreateWordExamples < ActiveRecord::Migration
  def change
    create_table :word_examples do |t|
      t.integer :word_id
      t.string :jp
      t.string :ko

      t.timestamps
    end
  end
end
