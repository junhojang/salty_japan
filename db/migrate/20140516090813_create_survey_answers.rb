class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.integer :question_id
      t.string :answer

      t.timestamps
    end
  end
end
