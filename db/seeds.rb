# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
  Player.destroy_all
  User.destroy_all
  List.destroy_all
puts "Done"

puts "Creating users..."
  User.create(email: "contact@eiffy.fr", password: "blacklist")
  User.create(email: "contact@nymph.fr", password: "blacklist")
puts "Done"

puts "Creating lists..."
  List.create(name: "blacklist")
  List.create(name: "whitelist")
puts "Done"

puts "Creating players..."
  Player.create(name: "Ei'ffy Khas", server: "Spriggan")
  Player.create(name: "Nymph Astadeviluke", server: "Cerberus")
  Player.create(name: "Gekido Mazoku", server: "Ragnarok")
  Player.create(name: "Chizu Kha", server: "Moogle")
  Player.create(name: "O'ra Nunh", server: "Omega")
  Player.create(name: "Shaoka Khao", server: "Moogle")
  Player.create(name: "Beh Vitrey", server: "Moogle")
  Player.create(name: "Cheria Mishima", server: "Cerberus")
  Player.create(name: "Aerhast Oschon", server: "Louisoix")
  Player.create(name: "Cordelia Nekko", server: "Louisoix")
puts "done"

puts "Finished!"
