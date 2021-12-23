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
class UserSurveyAnswer < ApplicationRecord
  belongs_to :user_survey
  belongs_to :survey_question

  validates :answer_text, presence: true
end
