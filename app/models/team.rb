class Team < ApplicationRecord
  has_many :players
  has_many :tournament_teams
  has_many :tournaments, through: :tournament_teams

  validates :name, presence: true
  validates :age_group, presence: true
  # validates :coach, presence: true
end
