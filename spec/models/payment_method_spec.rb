require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:token) }
    it { is_expected.to respond_to(:card_type) }
    it { is_expected.to respond_to(:last_four_digits) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:token) }
    it { is_expected.to validate_presence_of(:card_type) }
    it { is_expected.to validate_presence_of(:last_four_digits) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:user) }
  end
end
