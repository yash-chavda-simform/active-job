# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1.times do
  starting_time = DateTime.parse('2023-04-17 12:20:00')
  Event.create(name: Faker::Lorem.words(number: 3).join(" "), category: Faker::Lorem.word, entry_fees: Faker::Number.number(digits: 3), starting_time: starting_time)
end
