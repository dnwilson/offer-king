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
  targets = rand(4).times.map do
    user_1 = User.find(User.pluck(:id).sample)
    user_2 = User.find(User.pluck(:id).sample)
    ages = [user_1.age, user_2.age].sort
    genders = [user_1.gender, user_2.gender].uniq 
    Target.new(min_age: ages[0], max_age: rand(ages[0]..ages[1]), genders: genders)
  end

  description = Faker::Marketing.buzzwords
  Offer.create(
    description: "#{Faker::Commerce.product_name} - #{description}",
    image: "https://loremflickr.com/600/350/sale?random=#{i}",
    targets: targets
  )
}