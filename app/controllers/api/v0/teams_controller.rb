class Api::V0::TeamsController < ApplicationController
  def index
    tournament = Tournament.find_by(id: params[:tournament_id])
    teams = tournament.teams
    options = {}
    options[:include] = [:players]
    rendor json: TeamSerializer.new(teams, options)
  end
end
