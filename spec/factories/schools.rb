FactoryBot.define do
  factory :school do
    name { Faker::University.name }
    type { School.school_type.values.sample }
    founding_year { Date.today }
  end
end
