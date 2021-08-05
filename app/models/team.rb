class Team < ApplicationRecord
  validates :name, presence: true
  validates :age_group, presence: true
  validates :coach, presence: true
end
