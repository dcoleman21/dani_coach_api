class AssessmentSerializer
  include FastJsonapi::ObjectSerializer
  set_type 'assessments'
  attributes :rating,
             :player_id,
             :tournament_id,
             :assessment_type
  # belongs_to :user
  # belongs_to :tournament
  # belongs_to :player
end
