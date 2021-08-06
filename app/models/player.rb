class Player < ApplicationRecord
  belongs_to :team
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :birthday, format: { with: /^\d{4}-\d{2}-\d{2}$/, multiline: true }, presence: true
  validates :graduation_year, presence: true
  validates :position, presence: true
  validates :recruit, presence: true
end
