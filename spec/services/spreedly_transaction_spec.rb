require 'rails_helper'

RSpec.describe SpreedlyTransaction do
  describe '.purchase' do
    context 'when transaction succeeds' do
      let(:invoice) { double('Invoice') }
      let(:transaction) { double('Transaction') }
      let(:payment_method) { double('Payment Method') }

      before do
        allow(SpreedlyTransaction)
          .to receive_message_chain(
            :spreedly_env, :purchase_on_gateway
          ).and_return(transaction)
        allow(transaction).to receive('succeeded?').and_return(true)
        allow(transaction).to receive(:token).and_return('token')
      end

      it 'creates a payment' do
        expect(Payment).to receive(:create).once
        SpreedlyTransaction.purchase(invoice, 100, 'token', payment_method)
      end
    end

    context 'when transaction does not succeed' do
      let(:invoice) { double('Invoice') }
      let(:transaction) { double('Transaction') }
      let(:payment_method) { double('Payment Method') }

      before do
        allow(SpreedlyTransaction)
          .to receive_message_chain(
            :spreedly_env, :purchase_on_gateway
          ).and_return(transaction)
        allow(transaction).to receive('succeeded?').and_return(false)
        allow(transaction).to receive(:token).and_return('token')
      end

      it 'creates a payment' do
        expect(Payment).not_to receive(:create)
        SpreedlyTransaction.purchase(invoice, 100, 'token', payment_method)
      end
    end
  end

  context 'when transaction raises an exception' do
    pending 'test when transaction raises an exception'
  end
end
