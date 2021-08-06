require 'rails_helper'

describe 'Teams API' do
  describe 'Happy Path' do
    it "returns all teams for a single tournament, with optionally included team rosters" do
      tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
      team1 = Team.create!(name: "Orlando Blaze", age_group: "N/A")
      team2 = Team.create!(name: "Ohio All Stars", age_group: "N/A")
      team3 = Team.create!(name: "Mile High Magic", age_group: "N/A")
      tournament_team1 = TournamentTeam.create!(tournament: tournament, team: team1)
      tournament_team2 = TournamentTeam.create!(tournament: tournament, team: team2)
      tournament_team2 = TournamentTeam.create!(tournament: tournament, team: team3)
      player1 = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
      player2 = Player.create!(first_name: "Dan", last_name: "Holland", height: 75, weight: 201, birthday: "2005-02-23", graduation_year: 2023, position: "Center", recruit: true, team: team2)
      player3 = Player.create!(first_name: "Scott", last_name: "Thompson", height: 70, weight: 175, birthday: "2007-02-23", graduation_year: 2025, position: "Point Guard", recruit: true, team: team3)
      player4 = Player.create!(first_name: "Omar", last_name: "Brown", height: 71, weight: 182, birthday: "2006-07-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
      player5 = Player.create!(first_name: "Olaf", last_name: "Schliner", height: 73, weight: 190, birthday: "2007-04-23", graduation_year: 2025, position: "Forward", recruit: true, team: team2)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      request_body = {
        'tournaments': tournament.id,
        'teams': [team1, team2, team3],
        'players': [player1, player2, player3, player4, player5]
      }

      get "/api/v0/tournaments/#{tournament.id}/teams?included=players"

      teams = JSON.parse(response.body, symbolize_names: true)
      require "pry"; binding.pry
    end
  end
end
