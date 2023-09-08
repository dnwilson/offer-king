FactoryBot.define do
  factory :offer do
    sequence(:description) { |n| "#{Faker::Marketing.buzzwords} - #{n}" }
    sequence(:image) { |n| "https://loremflickr.com/600/350/sale?random=#{n}" }

    transient do
      user { build(:user) }
    end

    trait :for_user do
      after(:build) do |record, options|
        user = options.user
        record.targets << build(:target, min_age: 13, max_age: user.age, genders: [user.gender])
      end
    end
  end
end
