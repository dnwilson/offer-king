FactoryBot.define do
  factory :offer do
    sequence(:description) { |n| "#{Faker::Marketing.buzzwords} - #{n}" }
    sequence(:image) { |n| "https://loremflickr.com/600/350/sale?random=#{n}" }
  end
end
