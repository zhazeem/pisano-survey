class SurveyQuestion < ApplicationRecord
  belongs_to :survey

  validates :question_text, presence: true
end
