require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user, email: 'test@example.com') }

  describe 'fields' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:admin) }
    it { is_expected.to respond_to(:encrypted_password) }
    it { is_expected.to respond_to(:sign_in_count) }
    it { is_expected.to respond_to(:current_sign_in_at) }
    it { is_expected.to respond_to(:last_sign_in_at) }
    it { is_expected.to respond_to(:current_sign_in_ip) }
    it { is_expected.to respond_to(:last_sign_in_ip) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:oauth_authorizations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe '#email' do
    it 'matches a test example' do
      expect(user.email).to match 'test@example.com'
    end
  end

  describe '#admin' do
    let(:admin) { FactoryGirl.build(:user, :admin) }
    it 'returns false for a normal user' do
      expect(user.admin).to be false
    end
    it 'returns true for an admin' do
      expect(admin.admin).to be true
    end
  end
end
