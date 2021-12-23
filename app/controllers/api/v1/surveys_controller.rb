class Api::V1::SurveysController < Api::V1::BaseController
  before_action :authenticate_user_from_token!, only: [:submit]

  def show
    render json: Survey.first
  end

  def submit
    user_survey = SurveySubmissionService.new(@current_user, survey, user_survey_params).call
    if user_survey
      render json: user_survey
    else
      render_error('api.errors.submit_failed', nil)
    end
  end

  private
  def user_survey_params
    params.require(:survey).permit(:survey_questions => [:id, :answer_text])
  end

  def survey
    @survey ||= Survey.find(params[:id])
  end
end