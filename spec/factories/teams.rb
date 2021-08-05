FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
    age_group { Faker::Number.within(range: 15..18) }
    coach { Faker::Name.name }
  end
end
