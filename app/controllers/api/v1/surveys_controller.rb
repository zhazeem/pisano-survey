class Api::V1::SurveysController < Api::V1::BaseController
  def show
    render json: Survey.first
  end
end