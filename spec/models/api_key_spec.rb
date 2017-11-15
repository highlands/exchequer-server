require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:manager) }
    it { should validate_presence_of(:auth_token) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:manager) }
  end
end
