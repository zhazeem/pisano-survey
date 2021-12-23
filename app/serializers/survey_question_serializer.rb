class SurveyQuestionSerializer < ActiveModel::Serializer
  attributes :id, :question_text, :answer_options

  def answer_options
    object.answer_options.to_s.split(',')
  end
end