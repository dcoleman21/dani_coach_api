FactoryBot.define do
  factory :player do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    height { 72 }
    weight { 188 }
    birthday { "2006-02-23" }
    graduation_year { 2025 }
    position { Faker::Sports::Basketball.position }
    recruit { true }
  end
end
