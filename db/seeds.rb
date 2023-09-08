Offer.destroy_all
User.destroy_all

25.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
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