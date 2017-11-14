require 'rails_helper'

RSpec.describe App, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:api_keys) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:api_keys) }
    it { is_expected.to have_many(:offers) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
