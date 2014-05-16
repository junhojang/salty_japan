class CreateQpconCategories < ActiveRecord::Migration
  def change
    create_table :qpcon_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
