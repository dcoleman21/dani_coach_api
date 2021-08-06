class Api::V0::TournamentsController < ApplicationController
  def index
    render json: TournamentSerializer.new
  end
end
