require 'rails_helper'

RSpec.describe Checkout, type: :model do
  describe '.pre_validation' do
    let(:offer) { double('Offer') }
    let(:amount) { 300 }

    context 'when due_on is not expired' do
      let(:offer) { double('Offer', due_on: Time.zone.now + 3.days) }

      it 'does not raise any exception' do
        expect { Checkout.pre_validation(offer, amount) }.not_to raise_error
      end
    end

    context 'when due_on is expired' do
      let(:offer) { double('Offer', due_on: Time.zone.now - 3.days) }

      it 'raises an exception' do
        expect { Checkout.pre_validation(offer, amount) }.to raise_error(Offer::DueOnExpired)
      end
    end

    context 'when offer is not deferrable' do
      let(:offer) do
        double('Offer',
          due_on: Time.zone.now - 3.days,
          deferrable: false, amount: 100)
      end

      context 'when we do not pay the full price' do
        let(:amount) { 10 }

        it 'raises an exception' do
          expect { Checkout.pre_validation(offer, amount) }.to raise_error(Offer::DeferrableNotAllowed)
        end
      end

      context 'when we pay the full price' do
        let(:amount) { 100 }

        it 'does not raise an exception' do
          expect { Checkout.pre_validation(offer, amount) }.not_to raise_error
        end
      end
    end
  end
end
