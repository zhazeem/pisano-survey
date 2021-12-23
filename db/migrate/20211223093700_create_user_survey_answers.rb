class CreateUserSurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_survey_answers do |t|
      t.belongs_to :user_survey
      t.belongs_to :survey_question
      t.text :answer_text
      t.timestamps
    end
  end
end
