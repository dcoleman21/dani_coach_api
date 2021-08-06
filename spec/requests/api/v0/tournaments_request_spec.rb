require 'rails_helper'

describe 'Tournaments API' do
  describe 'Happy Path' do
    it "returns all tournament info in JSON format" do
      tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
      team = Team.create!(name: "Orlando Blaze", age_group: "N/A")
      tournament_team = TournamentTeam.create!(tournament: tournament, team: team)
      player = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      request_body = {
        'tournaments': tournament,
        'teams': team,
        'players': player
      }

      get '/api/v0/tournaments', headers: headers, params: JSON.generate(request_body)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      tournaments = JSON.parse(response.body, symbolize_names: true)

      expect(tournaments).to be_a(Hash)
      expect(tournaments).to have_key(:data)
      expect(tournaments[:data]).to be_an(Array)
      expect(tournaments[:data][0]).to be_a(Hash)

      expect(tournaments[:data][0]).to have_key(:id)
      expect(tournaments[:data][0][:id]).to be_a(String)
      expect(tournaments[:data][0]).to have_key(:type)
      expect(tournaments[:data][0][:type]).to be_a(String)
      expect(tournaments[:data][0]).to have_key(:attributes)
      expect(tournaments[:data][0][:attributes]).to be_a(Hash)

      tournament_attributes = tournaments[:data][0][:attributes]

      expect(tournament_attributes).to have_key(:name)
      expect(tournament_attributes[:name]).to be_a(String)
      expect(tournament_attributes).to have_key(:city)
      expect(tournament_attributes[:city]).to be_a(String)
      expect(tournament_attributes).to have_key(:state)
      expect(tournament_attributes[:state]).to be_a(String)
      expect(tournament_attributes).to have_key(:start_date)
      expect(tournament_attributes[:start_date]).to be_a(String)

      expect(tournaments[:data][0]).to have_key(:relationships)
      expect(tournaments[:data][0][:relationships]).to be_a(Hash)

      tournament_relationships = tournaments[:data][0][:relationships]

      expect(tournament_relationships).to have_key(:teams)
      expect(tournament_relationships[:teams]).to be_a(Hash)
      expect(tournament_relationships[:teams]).to have_key(:data)
      expect(tournament_relationships[:teams][:data]).to be_an(Array)
      expect(tournament_relationships[:teams][:data][0]).to have_key(:id)
      expect(tournament_relationships[:teams][:data][0][:id]).to be_a(String)
      expect(tournament_relationships[:teams][:data][0]).to have_key(:type)
      expect(tournament_relationships[:teams][:data][0][:type]).to be_a(String)

      expect(tournament_relationships).to have_key(:players)
      expect(tournament_relationships[:players]).to be_a(Hash)
      expect(tournament_relationships[:players]).to have_key(:data)
      expect(tournament_relationships[:players][:data]).to be_an(Array)
      expect(tournament_relationships[:players][:data][0]).to have_key(:id)
      expect(tournament_relationships[:players][:data][0][:id]).to be_a(String)
      expect(tournament_relationships[:players][:data][0]).to have_key(:type)
      expect(tournament_relationships[:players][:data][0][:type]).to be_a(String)
    end
  end

  it "returns a single tournaments attending teams info in JSON format" do
    tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
    team = Team.create!(name: "Orlando Blaze", age_group: "N/A")
    tournament_team = TournamentTeam.create!(tournament: tournament, team: team)
    player = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team)

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    request_body = {
      'tournaments': tournament,
      'teams': team,
      'players': player
    }

    get "/api/v0/tournaments/#{tournament.id}", headers: headers, params: JSON.generate(request_body)
    tournament = JSON.parse(response.body, symbolize_names: true)
  end
end
