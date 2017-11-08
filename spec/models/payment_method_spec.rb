require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:token) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:token) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end
