FactoryBot.define do
  factory :user do
    id {Faker::Number.number(digits: 2)}
    name { Faker::Name.name }
    bio { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
