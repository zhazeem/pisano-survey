customer = Customer.find_or_create_by(name: 'test')
puts 'Customer added ...'

survey = customer.surveys.find_or_create_by(name: 'test survey')
puts 'Survey added ...'

survey.survey_questions.find_or_create_by(
  type: 'ChoiceQuestion',
  question_text: 'How was your experience with us today?',
  answer_options: 'Very Good,Good,Neutral,Bad,Very Bad',
  position: 1
)

survey.survey_questions.find_or_create_by(
  type: 'TextQuestion',
  question_text: 'Please explain the reason for your choice',
  position: 2
)

User.find_or_create_by(first_name: 'Zooz', last_name: 'Mooz')

puts 'Questions added ...'