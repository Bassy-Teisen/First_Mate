# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# profile = [
#     {name: "Captain Cook", phone_number: "23425565", description: "dhfgf"},
#     {name: "Jack Sparrow", phone_number: "230985565", description: "dhfgf"},
#     {name: "Jonny Bravo", phone_number: "2342745665", description: "dhfgf"},
#     {name: "Goku", phone_number: "2342556789", description: "dhfgf"},
# ]

# # Profile.create()

# Profile.destroy_all
# Profile.create!(profile)

User.create!(email: "zoo@bar.com", password: "123456")
User.create!(email: "zoo2@bar.com", password: "123456")
Profile.create!(user: User.first, name: "foobar", phone_number: 12345678, description: "sdfghjkl")
Profile.create!(user: User.second, name: "foobar2", phone_number: 12345678, description: "sdfghjkl")
Boat.create!(profile: Profile.first, category: "speedy boi", size: "big", capasity: "120people", activity: "fishing")
Voyage.create!(user: User.first, description: "this is my first voyage ;)", voyage: Date.today, launch: Time.now)

AppliedVoyage.create!(user: User.last, voyage: Voyage.first)