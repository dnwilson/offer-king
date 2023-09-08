FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    birthdate { Faker::Date.between(from: 80.years.ago, to: 13.years.ago) }
    gender { %w[male female other].sample }
    password { "passwerk" }
    password_confirmation { "passwerk" }
  end
end
