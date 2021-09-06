# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

0.upto(5) do 
    Owner.create(full_name: Faker::FunnyName.two_word_name)
end

# This creates 6 records of owners in the Datebase

0.upto(15) do
    owner = Owner.find(rand(1..6))
    Car.create(model: Faker::Vehicle.make, color: Faker::Color.color_name, owner: owner)
end

# This creates 16 car records with a random owner
