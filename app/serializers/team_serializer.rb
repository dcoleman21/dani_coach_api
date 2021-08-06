class TeamSerializer
  include FastJsonapi::ObjectSerializer
  set_type 'teams'
  attributes :name, :age_group
  has_many :players
end
