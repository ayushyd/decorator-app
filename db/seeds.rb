# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times {Category.create!(name: Faker::Lorem.word)}

10.times {Source.create!(name: Faker::Company.name)}

50.times {
  category = Category.all.sample
  source = Source.all.sample
  Article.create!(
    title: Faker::Lorem.sentence,
    url: Faker::Internet.url,
    category: category,
    source: source
  )
}
