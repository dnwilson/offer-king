Offer.destroy_all
User.destroy_all

25.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.between(from: 80.year.ago, to: 13.years.ago),
    email: Faker::Internet.email,
    gender: User.genders.values.sample,
    password: "passwerk",
    password_confirmation: "passwerk"
  )
end

200.times { |i|
  description = Faker::Marketing.buzzwords
  Offer.create(
    description: "#{Faker::Commerce.product_name} - #{description}",
    image: "https://loremflickr.com/600/350/sale?random=#{i}",
  )
}