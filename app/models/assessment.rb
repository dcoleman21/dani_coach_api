class Assessment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :tournament, dependent: :destroy
  belongs_to :player, dependent: :destroy

  validates :rating, presence: true
  validates :assessment_type, presence: true
end
