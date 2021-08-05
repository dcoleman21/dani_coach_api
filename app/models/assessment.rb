class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  belongs_to :player

  validates :rating, presence: true
  validates :assessment_type, presence: true
end
