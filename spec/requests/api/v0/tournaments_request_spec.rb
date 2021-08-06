require 'rails_helper'

describe 'Tournaments API' do
  describe 'Happy Path' do
    it "returns tournament info in JSON format" do
      # User.create!(email: 'dani@mycollege.edu', password: '1234')
      tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
      team = Team.create!(name: "Orlando Blaze", age_group: "N/A")
      player = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true)

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

      tournaments = JSON.parse(response.body, symbolize_names: true)
      require "pry"; binding.pry
    end
  end
end
