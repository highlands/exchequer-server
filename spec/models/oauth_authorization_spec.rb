require 'rails_helper'

RSpec.describe OauthAuthorization, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:provider) }
    it { is_expected.to respond_to(:uid) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end
