require 'rails_helper'

RSpec.describe "Api::V1::SurveysController", type: :request do
  let(:survey){ create(:survey) }
  let!(:q1){
    create(:survey_question,
            survey: survey,
            type: 'ChoiceQuestion',
            question_text: 'text 1',
            answer_options: 'Very Good,Good,Neutral,Bad,Very Bad',
            position: 1)
  }

  let!(:q2){
    create(:survey_question,
            survey: survey,
            type: 'TextQuestion',
            question_text: 'text 2',
            position: 2)
  }
  
  describe "GET /show/:id" do
    it "should return survey" do
      get api_v1_survey_path(id: survey.id)
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq survey.name
      expect(json[:survey_questions].first[:id]).to eq q1.id
      expect(json[:survey_questions].second[:id]).to eq q2.id
    end
  end
end
