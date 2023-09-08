FactoryBot.define do
  factory :target do
    offer { nil }
    min_age { 13 }
    max_age { 80 }
    genders { "male, female" }
  end
end
