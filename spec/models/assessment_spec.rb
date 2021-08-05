require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :tournament }
    it { should belong_to :player }
  end

  describe 'validations' do
    it { should validate_presence_of :rating }
    it { should validate_presence_of :assessment_type }
  end
end
