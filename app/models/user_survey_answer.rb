class UserSurveyAnswer < ApplicationRecord
  belongs_to :user_survey
  belongs_to :survey_question

  validates :answer_text, presence: true
end
