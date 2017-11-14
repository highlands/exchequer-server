require 'rails_helper'

RSpec.describe OauthAuthorization, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:provider) }
    it { is_expected.to respond_to(:uid) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#from_omniauth' do
    let(:auth) { { provider: 'facebook', uid: '1', info: { email: 'test@example.com', name: 'testing' } } }

    it 'creates or finds a user' do
      expect(OauthAuthorization.from_omniauth(auth)).to eq User.find_by(email: 'test@example.com')
    end

    it 'logs in with the same user with another provider' do
      OauthAuthorization.from_omniauth(auth) # create oauth user with its provider
      auth = { provider: 'github', uid: '2', info: { email: 'test@example.com', name: 'testing' } }
      expect(OauthAuthorization.from_omniauth(auth)).to eq User.find_by(email: 'test@example.com')
    end
  end
end
