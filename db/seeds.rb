customer = Customer.find_or_create_by(name: 'test')
puts 'Customer added ...'

survey = customer.surveys.find_or_create_by(name: 'test survey')
puts 'Survey added ...'