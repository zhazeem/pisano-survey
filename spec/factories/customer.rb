FactoryBot.define do
  factory :customer do
    sequence(:id)
    name { Faker::Name.name }
  end
end