# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email



puts 'Create Sports'
sports_list = ['Adventure Park', 'Airsoft', 'Atletism', 'Badminton', 'Basket', 'Biliard', 'Board games', 'Bowling', 'Card games', 'Ciclism', 'Dans', 'Darts', 'Dungeon', 'Echitatie', 'Fitness', 'Fotbal', 'Golf', 'Hamace', 'Handbal', 'Inot', 'Judo', 'Karate', 'Motociclism', 'Paintball', 'Parasutism', 'PingPong', 'Slackline', 'Squash', 'Tenis', 'Tir', 'Volei', 'Yoga', 'Hiking', 'Trekking']

sports_list.each do |sport|
  Sport.find_or_create_by(name: sport)
end

puts 'DONE'