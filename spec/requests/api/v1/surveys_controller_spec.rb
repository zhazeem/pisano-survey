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
  
  describe "GET /api/v1/surveys/:id" do
    it "should return survey" do
      get api_v1_survey_path(id: survey.id)
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:name]).to eq survey.name
      expect(json[:survey_questions].first[:id]).to eq q1.id
      expect(json[:survey_questions].second[:id]).to eq q2.id
    end
  end

  describe "POST /api/v1/surveys/:id/submit" do
    let(:user){ create(:user) }

    context 'with good params' do
      let!(:object) do
        {
          survey:{
            survey_questions:[{
              id: q1.id,
              answer_text: "Good"
            },{
              id: q2.id,
              answer_text: "this is just dummy text"
            }
            ]
          }
        }
      end

      it "should submit survey" do
        post submit_api_v1_survey_path(id: survey.id), params: object, headers: {Authorization: "bearer #{user.auth_token}"}

        expect(response).to have_http_status(200)
  
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:id]).not_to be_nil
        expect(json[:user_survey_answers].first[:question_text]).to eq q1.question_text
        expect(json[:user_survey_answers].first[:answer_text]).to eq object[:survey][:survey_questions].first[:answer_text]
      end
    end

    context 'with bad params' do
      let!(:object) do
        {
          survey:{
            survey_questions:[{
              id: q1.id,
              answer_text: ""
            },{
              id: q2.id,
              answer_text: "this is just dummy text"
            }
            ]
          }
        }
      end

      it "should submit survey" do
        post submit_api_v1_survey_path(id: survey.id), params: object, headers: {Authorization: "bearer #{user.auth_token}"}

        expect(response).to have_http_status(422)
  
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json[:error]).not_to be_nil
      end
    end
  end
end
