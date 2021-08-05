# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Users
@user1 = User.create!(first_name: "Dani", last_name: "Coleman", email: "dani@mycollege.edu", password: "1234")
@user2 = User.create!(first_name: "Tom", last_name: "Jones", email: "tom@mycollege.edu", password: "password")
@user3 = User.create!(first_name: "Gloria", last_name: "Billings", email: "gloria@mycollege.edu", password: "coach1")

# Tournements
@tournament1 = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
@tournament2 = Tournament.create!(name: "The Turkey Classic", city: "Cleveland", state: "OH", start_date: "2021-11-05")
@tournament3 = Tournament.create!(name: "High School All American Showcase Fall", city: "Denver", state: "CO", start_date: "2021-10-05")

# Teams
@team1 = Team.create!(name: "Orlando Blaze", age_group: "N/A")
@team2 = Team.create!(name: "Ohio All Stars", age_group: "N/A")
@team2 = Team.create!(name: "Mile High Magic", age_group: "N/A")
