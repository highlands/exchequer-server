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

  describe '#display_card_type' do
    context 'when the card type is Visa' do
      let(:payment_method) { FactoryGirl.create(:payment_method, card_type: 'visa') }
      it { expect(payment_method.display_card_type).to eq 'Visa' }
    end

    context 'when the card type is unmatched' do
      let(:payment_method) { FactoryGirl.create(:payment_method, card_type: 'unmatched') }
      it { expect(payment_method.display_card_type).to eq 'Other' }
    end
  end
end
