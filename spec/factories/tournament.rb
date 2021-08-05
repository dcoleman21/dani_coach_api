FactoryBot.define do
  factory :tournament do
    name { Faker::WorldCup.stadium }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    start_date { Faker::Date.in_date_period }
  end
end
