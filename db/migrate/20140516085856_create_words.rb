class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :stage_id
      t.integer :word_index
      t.string :word
      t.string :hiragana
      t.string :mean
      t.string :phonetics
      t.string :img_url
      t.integer :voice

      t.timestamps
    end
  end
end
