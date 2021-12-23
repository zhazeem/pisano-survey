class ChoiceQuestion < SurveyQuestion
  validates :answer_options, presence: true
end