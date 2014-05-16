class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.integer :user_id
      t.integer :survey_id
      t.string :result

      t.timestamps
    end
  end
end
