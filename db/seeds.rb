# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Users
user1 = User.create!(first_name: "Dani", last_name: "Coleman", email: "dani@mycollege.edu", password: "1234")
user2 = User.create!(first_name: "Tom", last_name: "Jones", email: "tom@mycollege.edu", password: "password")
user3 = User.create!(first_name: "Gloria", last_name: "Billings", email: "gloria@mycollege.edu", password: "coach1")

# Assessments
assessment1 = Assessment.create!(rating: 5, user_id: user1.id, tournament_id: tournament1.id, player_id: player2.id, assessment_type: "tournament")
assessment2 = Assessment.create!(rating: 7, user_id: user2.id, tournament_id: tournament2.id, player_id: player3.id, assessment_type: "tournament")
assessment3 = Assessment.create!(rating: 4, user_id: user3.id, tournament_id: tournament3.id, player_id: player1.id, assessment_type: "tournament")
assessment4 = Assessment.create!(rating: 8, user_id: user1.id, tournament_id: tournament2.id, player_id: player4.id, assessment_type: "tournament")
assessment5 = Assessment.create!(rating: 6, user_id: user2.id, tournament_id: tournament3.id, player_id: player5.id, assessment_type: "tournament")

# Tournements
tournament1 = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
tournament2 = Tournament.create!(name: "The Turkey Classic", city: "Cleveland", state: "OH", start_date: "2021-11-05")
tournament3 = Tournament.create!(name: "High School All American Showcase Fall", city: "Denver", state: "CO", start_date: "2021-10-05")

# Teams
team1 = Team.create!(name: "Orlando Blaze", age_group: "N/A")
team2 = Team.create!(name: "Ohio All Stars", age_group: "N/A")
team3 = Team.create!(name: "Mile High Magic", age_group: "N/A")

# Players
player1 = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true)
player2 = Player.create!(first_name: "Dan", last_name: "Holland", height: 75, weight: 201, birthday: "2005-02-23", graduation_year: 2023, position: "Center", recruit: true)
player3 = Player.create!(first_name: "Scott", last_name: "Thompson", height: 70, weight: 175, birthday: "2007-02-23", graduation_year: 2025, position: "Point Guard", recruit: true)
player4 = Player.create!(first_name: "Omar", last_name: "Brown", height: 71, weight: 182, birthday: "2006-07-23", graduation_year: 2024, position: "Shooting Guard", recruit: true)
player5 = Player.create!(first_name: "Olaf", last_name: "Schliner", height: 73, weight: 190, birthday: "2007-04-23", graduation_year: 2025, position: "Forward", recruit: true)
