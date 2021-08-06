class Api::V0::TournamentsController < ApplicationController
  def index
    tournaments = Tournament.all
    render json: TournamentsSerializer.new(tournaments)
  end
end
