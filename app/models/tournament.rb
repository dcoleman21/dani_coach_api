class Tournament < ApplicationRecord
  has_many :tournament_teams
  has_many :teams, through: :tournament_teams
  has_many :players, through: :teams

  validates :name, presence: true
  validates :city, presence: true
  validates :state, length: { maximum: 2 }, presence: true
  validates :start_date, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true }, presence: true
end
