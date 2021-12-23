FactoryBot.define do
  factory :survey do
    sequence(:id)
    name { Faker::Name.name }
    association :customer, factory: :customer
  end
end