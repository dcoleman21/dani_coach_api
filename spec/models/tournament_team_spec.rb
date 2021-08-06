require 'rails_helper'

RSpec.describe TournamentTeam, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
    it { should belong_to :tournament }
  end
end
