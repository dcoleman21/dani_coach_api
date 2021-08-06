class TeamsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age_group
end
