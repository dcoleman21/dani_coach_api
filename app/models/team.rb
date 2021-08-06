class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :tournament_teams, dependent: :destroy
  has_many :tournaments, through: :tournament_teams, dependent: :destroy

  validates :name, presence: true
  validates :age_group, presence: true
  # validates :coach, presence: true
end
