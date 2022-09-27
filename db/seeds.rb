# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'

User.destroy_all

10.times do |i|
  user = User.create(name: Faker::Movies::Lebowski.actor, 
              email: Faker::Internet.email,
              password: '654321')
  5.times do |j|
    demon = Demon.create(name: Faker::Fantasy::Tolkien.character,
                       speciality: Faker::Fantasy::Tolkien.race,
                       location: Faker::Fantasy::Tolkien.location,
                       user_id: user.id)
  end
end

puts 'Finished!'