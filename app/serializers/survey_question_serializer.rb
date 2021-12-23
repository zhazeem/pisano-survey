# == Schema Information
#
# Table name: survey_questions
#
#  id             :bigint           not null, primary key
#  answer_options :text
#  position       :integer          default(0)
#  question_text  :text             not null
#  type           :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  survey_id      :bigint
#
# Indexes
#
#  index_survey_questions_on_survey_id  (survey_id)
#  index_survey_questions_on_type       (type)
#
class SurveyQuestionSerializer < ActiveModel::Serializer
  attributes :id, :question_text, :answer_options

  def answer_options
    object.answer_options.to_s.split(',')
  end
end
