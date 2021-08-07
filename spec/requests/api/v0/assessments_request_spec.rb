require 'rails_helper'

describe 'Assessments API' do
  describe 'Happy Path' do
    it "creates a new assessment" do
      #user_id
      user = User.create!(first_name: "Dani", last_name: "Coleman", email: "dani@mycollege.edu", password: "1234")
      tournament = Tournament.create!(name: "The Orange Classic", city: "Orlando", state: "FL", start_date: "2021-09-05")
      team1 = Team.create!(name: "Orlando Blaze", age_group: "N/A")
      tournament_team1 = TournamentTeam.create!(tournament: tournament, team: team1)
      player1 = Player.create!(first_name: "Tim", last_name: "Smith", height: 72, weight: 188, birthday: "2006-02-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
      player4 = Player.create!(first_name: "Omar", last_name: "Brown", height: 71, weight: 182, birthday: "2006-07-23", graduation_year: 2024, position: "Shooting Guard", recruit: true, team: team1)
      assessment_attr = {
        'rating': 7,
        'player_id': player1.id,
        'tournament_id': tournament.id,
        'assessment_type': 'tournament'
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v0/assessments", headers: headers, params: JSON.generate(assessment_attr)
      # this post is returning status 200
      new_assessment = Assessment.last
      # new_assessment is returing nil, so it is not creating??
    end
  end
end
