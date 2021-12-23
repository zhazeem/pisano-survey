class UserSurveyAnswerSerializer < ActiveModel::Serializer
  attributes :answer_text, :question_text

  def question_text
    object.survey_question.question_text
  end
end