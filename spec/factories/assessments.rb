FactoryBot.define do
  factory :assessment do
    rating { Faker::Number.within(range: 1..10) }
    user { association :user }
    tournament { association :tournament }
    player { association :player }
    assessment_type { "tournament" }
  end
end
