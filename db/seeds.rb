# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Restaurant.destroy_all

5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: %w(chinese italian japanese french belgian).sample
  )

  rand(1..5).times do
    restaurant.reviews.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
  end
end
puts "Created #{Restaurant.count} restaurants with reviews."
