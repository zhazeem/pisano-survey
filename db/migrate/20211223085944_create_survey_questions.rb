class CreateSurveyQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_questions do |t|
      t.belongs_to :survey
      t.string :type, limit: 255, null: false, index: true
      t.text :question_text, null: false
      t.text :answer_options
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
