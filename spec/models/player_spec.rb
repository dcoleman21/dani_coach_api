require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
  end
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :height }
    it { should validate_presence_of :weight }
    it { should validate_presence_of :birthday }
    it { should validate_presence_of :graduation_year }
    it { should validate_presence_of :position }
    it { should validate_presence_of :recruit }
  end
end
