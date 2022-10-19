FactoryBot.define do
  factory :post do
    id { Faker::Number.number(digits: 2) }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
