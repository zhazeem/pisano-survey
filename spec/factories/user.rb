FactoryBot.define do
  factory :user do
    sequence(:id)
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
  end
end