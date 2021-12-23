# == Schema Information
#
# Table name: user_surveys
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_surveys_on_survey_id  (survey_id)
#  index_user_surveys_on_user_id    (user_id)
#
class UserSurvey < ApplicationRecord
  belongs_to :user
  belongs_to :survey

  has_many :user_survey_answers
end
