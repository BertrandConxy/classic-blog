FactoryBot.define do
  factory :comment do
    id { Faker::Number.number(digits: 5) }
    text { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
