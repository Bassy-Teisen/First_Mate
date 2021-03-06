# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Boat.destroy_all
Voyage.destroy_all
Profile.destroy_all
User.destroy_all

User.create!(email: "Garry@1.com", password: "123456")
User.create!(email: "Malcom@2.com", password: "123456")
User.create!(email: "Steve@3.com", password: "123456")
User.create!(email: "Josh@4.com", password: "123456")
User.create!(email: "Allen@0.com", password: "123456")
Profile.create!(user: User.first, name: "Garry", phone_number: 12345678, description: "Boating enthusist",profile_image: {io: File.open(Rails.root.join("./app/assets/images/captain.jpg")), filename: "captain.jpg"})
Profile.create!(user: User.second, name: "Malcom", phone_number: 12345678, description: "Boating enthusist",profile_image: {io: File.open(Rails.root.join("./app/assets/images/malcom.jpg")), filename: "malcom.jpg"})
Profile.create!(user: User.third, name: "Steve", phone_number: 12345678, description: "Boating enthusist",profile_image: {io: File.open(Rails.root.join("./app/assets/images/pose.jpg")), filename: "pose.jpg"})
Profile.create!(user: User.fourth, name: "Josh", phone_number: 12345678, description: "Boating enthusist",profile_image: {io: File.open(Rails.root.join("./app/assets/images/sailor.jpg")), filename: "sailor.jpg"})
Profile.create!(user: User.fourth, name: "Allen", phone_number: 12345678, description: "Boating enthusist",profile_image: {io: File.open(Rails.root.join("./app/assets/images/posh.jpg")), filename: "posh.jpg"})

Boat.create!(profile: Profile.first, category: "Tinny", size: "big", capasity: "120people", activity: "fishing",boat_image: {io: File.open(Rails.root.join("./app/assets/images/timber.jpg")), filename: "timber.jpg"})
Boat.create!(profile: Profile.second, category: "Kayak", size: "big", capasity: "120people", activity: "fishing",boat_image: {io: File.open(Rails.root.join("./app/assets/images/smfishing.jpg")), filename: "smfishing.jpg"})
Boat.create!(profile: Profile.third, category: "Cruise liner", size: "big", capasity: "120people", activity: "fishing",boat_image: {io: File.open(Rails.root.join("./app/assets/images/sail.jpg")), filename: "sail.jpg"})
Boat.create!(profile: Profile.fourth, category: "sail", size: "big", capasity: "120people", activity: "fishing",boat_image: {io: File.open(Rails.root.join("./app/assets/images/colds.jpg")), filename: "colds.jpg"})

Voyage.create!(user: User.first, description: "Going fishing)", voyage: Date.today, launch: Time.now)
Voyage.create!(user: User.second, description: "Going sailing", voyage: Date.today, launch: Time.now)
Voyage.create!(user: User.third, description: "kayaking trip", voyage: Date.today, launch: Time.now)

AppliedVoyage.create!(user: User.second, voyage: Voyage.first)
AppliedVoyage.create!(user: User.third, voyage: Voyage.first)
AppliedVoyage.create!(user: User.last, voyage: Voyage.first)
AppliedVoyage.create!(user: User.first, voyage: Voyage.second)
AppliedVoyage.create!(user: User.third, voyage: Voyage.second)
AppliedVoyage.create!(user: User.last, voyage: Voyage.second)