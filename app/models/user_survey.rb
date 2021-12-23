class UserSurvey < ApplicationRecord
  belongs_to :user
  belongs_to :survey

  has_many :user_survey_answers
end
