FactoryBot.define do
  factory :note do
    user { association :user }
    note { Faker::Lorem.sentence }
    assessment { association :assessment }
  end
end
