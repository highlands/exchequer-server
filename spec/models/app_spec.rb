require 'rails_helper'

RSpec.describe App, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:api_keys) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
