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

    get "/api/v0/tournaments/#{tournament.id}?included=teams", headers: headers, params: JSON.generate(request_body)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    tournament = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(tournament).to be_a(Hash)
    expect(tournament).to have_key(:data)
    expect(tournament[:data]).to be_a(Hash)

    expect(tournament[:data]).to have_key(:id)
    expect(tournament[:data][:id]).to be_a(String)
    expect(tournament[:data]).to have_key(:type)
    expect(tournament[:data][:type]).to be_a(String)
    expect(tournament[:data]).to have_key(:attributes)
    expect(tournament[:data][:attributes]).to be_a(Hash)

    tournament_attributes = tournament[:data][:attributes]

    expect(tournament_attributes).to have_key(:name)
    expect(tournament_attributes[:name]).to be_a(String)
    expect(tournament_attributes).to have_key(:city)
    expect(tournament_attributes[:city]).to be_a(String)
    expect(tournament_attributes).to have_key(:state)
    expect(tournament_attributes[:state]).to be_a(String)
    expect(tournament_attributes).to have_key(:start_date)
    expect(tournament_attributes[:start_date]).to be_a(String)

    expect(tournament[:data]).to have_key(:relationships)
    expect(tournament[:data][:relationships]).to be_a(Hash)

    tournament_relationships = tournament[:data][:relationships]

    expect(tournament_relationships).to have_key(:teams)
    expect(tournament_relationships[:teams]).to be_a(Hash)
    expect(tournament_relationships[:teams]).to have_key(:data)
    expect(tournament_relationships[:teams][:data]).to be_an(Array)
    expect(tournament_relationships[:teams][:data].count).to eq(3)
    expect(tournament_relationships[:teams][:data][0]).to have_key(:id)
    expect(tournament_relationships[:teams][:data][0][:id]).to be_a(String)
    expect(tournament_relationships[:teams][:data][0]).to have_key(:type)
    expect(tournament_relationships[:teams][:data][0][:type]).to be_a(String)

    expect(tournament_relationships).to have_key(:players)
    expect(tournament_relationships[:players]).to be_a(Hash)
    expect(tournament_relationships[:players]).to have_key(:data)
    expect(tournament_relationships[:players][:data]).to be_an(Array)
    expect(tournament_relationships[:players][:data].count).to eq(5)
    expect(tournament_relationships[:players][:data][0]).to have_key(:id)
    expect(tournament_relationships[:players][:data][0][:id]).to be_a(String)
    expect(tournament_relationships[:players][:data][0]).to have_key(:type)
    expect(tournament_relationships[:players][:data][0][:type]).to be_a(String)

    expect(tournament).to have_key(:included)
    expect(tournament[:included]).to be_an(Array)
    expect(tournament[:included][0]).to have_key(:id)
    expect(tournament[:included][0][:id]).to be_a(String)
    expect(tournament[:included][0]).to have_key(:type)
    expect(tournament[:included][0][:type]).to be_a(String)
    expect(tournament[:included][0]).to have_key(:attributes)
    expect(tournament[:included][0][:attributes]).to be_a(Hash)
    expect(tournament[:included][0][:attributes]).to have_key(:name)
    expect(tournament[:included][0][:attributes][:name]).to be_a(String)
    expect(tournament[:included][0][:attributes]).to have_key(:age_group)
    expect(tournament[:included][0][:attributes][:age_group]).to be_a(String)
    expect(tournament[:included][0]).to have_key(:relationships)
    expect(tournament[:included][0][:relationships]).to be_a(Hash)
    expect(tournament[:included][0][:relationships]).to have_key(:players)
    expect(tournament[:included][0][:relationships][:players]).to be_a(Hash)
    expect(tournament[:included][0][:relationships][:players]).to have_key(:data)
    expect(tournament[:included][0][:relationships][:players][:data]).to be_an(Array)
    expect(tournament[:included][0][:relationships][:players][:data].count).to eq(2)
    expect(tournament[:included][0][:relationships][:players][:data][0]).to have_key(:id)
    expect(tournament[:included][0][:relationships][:players][:data][0][:id]).to be_a(String)
    expect(tournament[:included][0][:relationships][:players][:data][0]).to have_key(:type)
    expect(tournament[:included][0][:relationships][:players][:data][0][:type]).to be_a(String)
  end
end
