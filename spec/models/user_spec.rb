require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :cell_phone }
    it { should validate_presence_of :signature }
    it { should validate_presence_of :internal_email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :token }
    it { should validate_uniqueness_of :token }
  end
end
