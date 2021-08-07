class Api::V0::AssessmentsController < ApplicationController
  def create
    render json: AssessmentSerializer.new(Assessment.first)
  end
end
