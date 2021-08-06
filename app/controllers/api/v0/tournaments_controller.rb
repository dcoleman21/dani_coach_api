class Api::V0::TournamentsController < ApplicationController
  def index
    tournaments = Tournament.all
    render json: TournamentSerializer.new(tournaments)
  end

  def show
    tournament = Tournament.find(params[:id])
    options = {}
    options[:include] = [:teams]
    render json: TournamentSerializer.new(tournament, options)
  end
end
