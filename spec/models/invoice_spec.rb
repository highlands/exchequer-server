require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'fields' do
    it { is_expected.to respond_to(:offer) }
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:payments) }
    it { is_expected.to respond_to(:line_items) }
    it { is_expected.to respond_to(:due_on) }
  end

  describe 'validations' do
    it { should validate_presence_of(:offer) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:due_on) }
  end

  describe '#balance_paid' do
    let(:invoice) { FactoryGirl.create(:invoice) }

    context 'when user has no payments yet' do
      it 'returns the balance already paid by summing the transactions' do
        expect(invoice.balance_paid). to eq 0
      end
    end

    context 'when user has payments' do
      let(:payments) { FactoryGirl.create(:payment, amount: 100) }

      before do
        invoice.payments << payments
      end

      it 'returns the balance already paid by summing the transactions' do
        expect(invoice.balance_paid). to eq 100
      end
    end
  end

  describe '#subtotal' do
    let(:offer) { FactoryGirl.create(:offer, amount: 350) }
    let(:invoice) { FactoryGirl.create(:invoice, offer: offer) }

    context 'when user has no payments yet' do
      it 'returns the subtotal that is equals to the offer amount' do
        expect(invoice.subtotal). to eq offer.amount
      end
    end

    context 'when user has payments' do
      let(:coupon) { FactoryGirl.create(:coupon, offer: offer) }
      let(:payment) { FactoryGirl.create(:payment, amount: 100, invoice: invoice) }
      let(:line_item_offer) do
        LineItem.create(offer: offer,
                        amount: payment.amount, invoice: invoice, quantity: 1)
      end

      let(:line_item_coupon) do
        LineItem.create(coupon: coupon,
                        amount: payment.amount, invoice: invoice, quantity: 1)
      end

      before do
        invoice.line_items << [line_item_offer, line_item_coupon]
      end

      it 'returns the subtotal already paid not including coupons' do
        expect(invoice.subtotal). to eq 100
      end
    end
  end

  describe '#total' do
    let(:offer) { FactoryGirl.create(:offer, amount: 350) }
    let(:invoice) { FactoryGirl.create(:invoice, offer: offer) }

    context 'when user has no payments yet' do
      it 'returns the total that is equals to the offer amount' do
        expect(invoice.total). to eq offer.amount
      end
    end

    context 'when user has no payment, but only a discount' do
      let(:offer) { FactoryGirl.create(:offer, amount: 350) }
      let(:invoice) { FactoryGirl.create(:invoice, offer: offer) }

      let(:coupon) { FactoryGirl.create(:coupon, offer: offer) }
      let(:line_item_offer) do
        LineItem.create(offer: offer,
                        amount: offer.amount, invoice: invoice, quantity: 1)
      end

      let(:line_item_coupon) do
        # A coupon code of 100 USD off
        LineItem.create(coupon: coupon,
                        amount: 100, invoice: invoice, quantity: 1)
      end

      before do
        invoice.line_items << [line_item_offer, line_item_coupon]
      end

      it 'returns the total only counting the discount' do
        expect(invoice.total). to eq 250
      end
    end

    context 'when user has payments and discounts' do
      let(:offer) { FactoryGirl.create(:offer, amount: 350) }
      let(:invoice) { FactoryGirl.create(:invoice, offer: offer) }

      let(:coupon) { FactoryGirl.create(:coupon, offer: offer) }
      let(:payment) { FactoryGirl.create(:payment, amount: 100, invoice: invoice) }
      let(:line_item_offer) do
        LineItem.create(offer: offer,
                        amount: offer.amount, invoice: invoice, quantity: 1)
      end

      let(:line_item_coupon) do
        # A coupon code of 100 USD off
        LineItem.create(coupon: coupon,
                        amount: 100, invoice: invoice, quantity: 1)
      end

      before do
        invoice.line_items << [line_item_offer, line_item_coupon]
        invoice.payments << payment
      end

      it 'returns the total' do
        # Offer was 350.
        # It has a discount of 100 OFF.
        # A Payment of 100.
        # Total is final total including discounts.
        # Total is only 250.
        # Remaining Balance is 150.
        expect(invoice.total). to eq 250
        expect(invoice.balance_remaining).to eq 150
      end
    end
  end

  describe '#balance_remaining' do
    context 'when user has no payments yet' do
      let(:offer) { FactoryGirl.create(:offer, amount: 350) }
      let(:invoice) { FactoryGirl.create(:invoice, offer: offer) }

      it 'returns the total that is equals to the offer amount' do
        # Offer was 350
        # No Payments.
        # No Discounts.
        # The remaining balance should be the offer amount.
        expect(invoice.balance_remaining). to eq offer.amount
      end
    end

    context 'when user has payments and discounts' do
      let(:offer) { FactoryGirl.create(:offer, amount: 350) }
      let(:invoice) { FactoryGirl.create(:invoice, offer: offer) }

      let(:coupon) { FactoryGirl.create(:coupon, offer: offer) }
      let(:payment) { FactoryGirl.create(:payment, amount: 100, invoice: invoice) }
      let(:line_item_offer) do
        LineItem.create(offer: offer,
                        amount: offer.amount, invoice: invoice, quantity: 1)
      end

      let(:line_item_coupon) do
        # A coupon code of 100 USD off
        LineItem.create(coupon: coupon,
                        amount: 100, invoice: invoice, quantity: 1)
      end

      before do
        invoice.line_items << [line_item_offer, line_item_coupon]
        invoice.payments << payment
      end

      it 'returns the total' do
        # Offer was 350.
        # It has a discount of 100 OFF.
        # It has a payment of 100.
        # Remaining balance should be 150.
        expect(invoice.balance_remaining). to eq 150
      end
    end
  end
end
