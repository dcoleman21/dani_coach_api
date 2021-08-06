class TournamentsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :city, :state, :start_date
  has_many :teams
  has_many :players, through: :teams
end
