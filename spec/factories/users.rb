FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    account { Faker::Internet.username }
    email { Faker::Internet.email }
  end
end
