require 'rails_helper'

RSpec.describe Checkout, type: :model do
  describe 'validations' do
    let(:offer) { double('Offer', due_on: Time.zone.now + 3.days, deferrable: true) }
    let(:amount) { 300 }
    let(:invoice) { double('Invoice') }
    let(:user) { double('User') }

    context 'initialization' do
      it 'must have invoice' do
        expect do
          Checkout.new(user: user,
                       offer: offer,
                       amount: amount)
        end.to raise_error(ActiveModel::ValidationError, /Invoice can't be blank/)
      end

      it 'must have user' do
        expect do
          Checkout.new(invoice: invoice,
                       offer: offer,
                       amount: amount)
        end.to raise_error(ActiveModel::ValidationError, /User can't be blank/)
      end
    end

    context 'when due_on is not expired' do
      let(:offer) { double('Offer', due_on: Time.zone.now + 3.days, deferrable: true) }

      it 'does not raise any exception' do
        expect do
          Checkout.new(invoice: invoice,
                       user: user,
                       offer: offer,
                       amount: amount)
        end.not_to raise_error
      end
    end

    context 'when due_on is expired' do
      let(:offer) { double('Offer', due_on: Time.zone.now - 3.days, deferrable: true) }

      it 'raises an exception' do
        expect do
          Checkout.new(invoice: invoice,
                       user: user,
                       offer: offer,
                       amount: amount)
        end.to raise_error(Offer::DueOnExpired)
      end
    end
  end
end
