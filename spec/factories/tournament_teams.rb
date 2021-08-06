FactoryBot.define do
  factory :tournament_team do
    team { Faker::Team.name }
    tournament { Faker::WorldCup.stadium }
  end
end
