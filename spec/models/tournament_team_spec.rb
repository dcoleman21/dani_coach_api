require 'rails_helper'

RSpec.describe TournamentTeam, type: :model do
  it { should belong_to :team }
  it { should belong_to :tournament }
end
