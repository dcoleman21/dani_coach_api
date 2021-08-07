# require 'rails_helper'
#
# describe 'Players API' do
#   describe 'Happy Path' do
#     it "returns player details and assessment on each of them on tournament performance" do
#       user = User.create!(first_name: "Dani", last_name: "Coleman", email: "dani@mycollege.edu", password: "1234")
#       tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
#       team1 = Team.create!(name: "Orlando Blaze", age_group: "N/A")
#       tournament_team1 = TournamentTeam.create!(tournament: tournament, team: team1)
#       player1 = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
#       # player4 = Player.create!(first_name: "Omar", last_name: "Brown", height: 71, weight: 182, birthday: "2006-07-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
#       assessment1 = Assessment.create!(rating: 5, user_id: user.id, tournament_id: tournament.id, player_id: player1.id, assessment_type: "tournament")
#       assessment2 = Assessment.create!(rating: 7, user_id: user.id, tournament_id: tournament.id, player_id: player1.id, assessment_type: "tournament")
#
#       headers = {
#         'Content-Type': 'application/json',
#         'Accept': 'application/json'
#       }
#
#       request_body = {
#         'players': player1.id,
#         'assessments': [assessment1, assessment2]
#       }
#
#       get "/api/v0/players/#{player1.id}?included=assessments"
#       players = JSON.parse(response.body, symbolize_names: true)
#     end
#   end
# end
