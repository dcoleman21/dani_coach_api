require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :assessment }
  end

  describe 'validations' do
    it { should validate_presence_of :note }
  end
end
