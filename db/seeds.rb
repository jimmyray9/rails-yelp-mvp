# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Restaurant.destroy_all

10.times do
	r = Restaurant.new({
		name: Faker::Dessert.flavor,
		address: Faker::Address.full_address,
		category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
		phone_number: Faker::PhoneNumber.phone_number
	})
	r.save!
	s = 5.times do 
		newReview = Review.new()
		newReview.rating = rand(5)
		newReview.content = Faker::GreekPhilosophers.quote
		newReview.restaurant = r
		newReview.save!
	end

end