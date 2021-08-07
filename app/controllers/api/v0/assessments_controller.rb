class Api::V0::AssessmentsController < ApplicationController
  def create
    render json: AssessmentSerializer.new(Assessment.create(params[:assessment]))
  end

  private

  def assessment_params
    params.require(:assessment).permit(:rating, :player_id, :tournament_id, :assessment_type)
  end
end
