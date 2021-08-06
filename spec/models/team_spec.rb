require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
    it { should have_many :tournament_teams }
    it { should have_many(:tournaments).through(:tournament_teams) }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age_group }
    # it { should validate_presence_of :coach }
  end
end
