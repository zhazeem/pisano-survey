# == Schema Information
#
# Table name: user_survey_answers
#
#  id                 :bigint           not null, primary key
#  answer_text        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  survey_question_id :bigint
#  user_survey_id     :bigint
#
# Indexes
#
#  index_user_survey_answers_on_survey_question_id  (survey_question_id)
#  index_user_survey_answers_on_user_survey_id      (user_survey_id)
#
class UserSurveyAnswerSerializer < ActiveModel::Serializer
  attributes :answer_text, :question_text

  def question_text
    object.survey_question.question_text
  end
end
