class SurveySubmissionService

  def initialize(user, survey, params)
    @user = user
    @survey = survey
    @params = params
  end

  def call
    user_survey = @user.user_surveys.create(survey: @survey)
    return nil unless user_survey
    @params[:survey_questions].each do |survey_question|
      user_survey_answer = create_user_survey_answer(user_survey, survey_question)
      return nil unless user_survey_answer.errors.empty?
    end
    user_survey
  end

  private
  def create_user_survey_answer(user_survey, survey_question)
    user_survey.user_survey_answers.create(
      survey_question: SurveyQuestion.find(survey_question[:id]),
      answer_text: survey_question[:answer_text]
    )
  end
end