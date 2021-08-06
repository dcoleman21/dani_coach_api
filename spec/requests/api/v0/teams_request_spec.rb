require 'rails_helper'

describe 'Teams API' do
  describe 'Happy Path' do
    it "returns all teams for a single tournament, with optionally included team rosters" do
      tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
      team1 = Team.create!(name: "Orlando Blaze", age_group: "N/A")
      tournament_team1 = TournamentTeam.create!(tournament: tournament, team: team1)
      player1 = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
      player4 = Player.create!(first_name: "Omar", last_name: "Brown", height: 71, weight: 182, birthday: "2006-07-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      request_body = {
        'tournaments': tournament.id,
        'teams': [team1],
        'players': [player1, player4]
      }

      get "/api/v0/tournaments/#{tournament.id}/teams?included=players"
      expect(response).to be_successful
      expect(response.status).to eq(200)
      teams = JSON.parse(response.body, symbolize_names: true)
      expect(teams).to be_a(Hash)
      expect(teams).to have_key(:data)
      expect(teams[:data]).to be_an(Array)
      team_info = teams[:data][0]
      expect(team_info).to be_a(Hash)
      expect(team_info).to have_key(:id)
      expect(team_info[:id]).to be_a(String)
      expect(team_info).to have_key(:type)
      expect(team_info[:type]).to be_a(String)
      expect(team_info).to have_key(:attributes)
      team_attr = team_info[:attributes]
      expect(team_attr).to be_a(Hash)
      expect(team_attr).to have_key(:name)
      expect(team_attr[:name]).to be_a(String)
      expect(team_attr).to have_key(:age_group)
      expect(team_attr[:age_group]).to be_a(String)
      expect(team_info).to have_key(:relationships)
      team_relationships = team_info[:relationships]
      expect(team_relationships).to be_a(Hash)
      expect(team_relationships).to have_key(:players)
      expect(team_relationships[:players]).to be_a(Hash)
      expect(team_relationships[:players]).to have_key(:data)
      expect(team_relationships[:players][:data]).to be_an(Array)
      expect(team_relationships[:players][:data].count).to eq(2)
      expect(team_relationships[:players][:data][0]).to have_key(:id)
      expect(team_relationships[:players][:data][0][:id]).to be_a(String)
      expect(team_relationships[:players][:data][0]).to have_key(:type)
      expect(team_relationships[:players][:data][0][:type]).to be_a(String)
      expect(teams).to have_key(:included)
      expect(teams[:included]).to be_an(Array)
      expect(teams[:included].count).to eq(2)
      team_roster = teams[:included][0]
      expect(team_roster).to have_key(:id)
      expect(team_roster[:id]).to be_a(String)
      expect(team_roster).to have_key(:type)
      expect(team_roster[:type]).to be_a(String)
      expect(team_roster).to have_key(:attributes)
      expect(team_roster[:attributes]).to be_a(Hash)
      player_attr = team_roster[:attributes]
      expect(player_attr).to have_key(:first_name)
      expect(player_attr[:first_name]).to be_a(String)
      expect(player_attr).to have_key(:last_name)
      expect(player_attr[:last_name]).to be_a(String)
      expect(player_attr).to have_key(:height)
      expect(player_attr[:height]).to be_an(Integer)
      expect(player_attr).to have_key(:weight)
      expect(player_attr[:weight]).to be_an(Integer)
      expect(player_attr).to have_key(:birthday)
      expect(player_attr[:birthday]).to be_a(String)
      expect(player_attr).to have_key(:graduation_year)
      expect(player_attr[:graduation_year]).to be_an(Integer)
      expect(player_attr).to have_key(:position)
      expect(player_attr[:position]).to be_a(String)
      expect(player_attr).to have_key(:recruit)
      expect(player_attr[:recruit]).to be_a(TrueClass)
    end
  end
end
