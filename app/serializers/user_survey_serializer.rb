class UserSurveySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :survey
  has_many :user_survey_answers
end