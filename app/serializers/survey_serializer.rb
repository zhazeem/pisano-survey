class SurveySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :survey_questions do
    object.survey_questions.order(position: :asc)
  end
end