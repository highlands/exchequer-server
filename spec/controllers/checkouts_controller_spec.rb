require 'rails_helper'

RSpec.describe CheckoutsController, type: :controller do
  context 'Authenticated' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'POST create' do
      context 'WHEN user has NOT payments methods' do
        let(:offer) { double('Offer', id: 1, amount: 1, to_i: 1, due_on: Time.zone.now) }

        it 'renders the checkout page' do
          post :create, params: { offer_id: 1 }
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_payment_method_path)
        end
      end
    end

    describe 'GET new' do
      context 'WHEN user has NOT payments methods' do
        let(:offer) { double('Offer', id: 1, amount: 1, to_i: 1, due_on: Time.zone.now) }

        it 'renders the checkout page' do
          get :new, params: { offer_id: 1 }
          expect(response).to have_http_status(200)
          expect(response).not_to redirect_to(new_payment_method_path)
        end
      end

      context 'WHEN user HAS payments methods' do
        let(:offer) { double('Offer', amount: 1, to_i: 1, due_on: Time.zone.now) }
        let(:invoice) { double('Invoice', balance_remaining: 10) }

        before do
          allow(user).to receive(:payment_method_present?).and_return(true)
          allow(Offer).to receive(:find_by).and_return(offer)
          allow(Invoice).to receive(:find_or_create_for).and_return(invoice)
        end

        it 'adds a payment method' do
          get :new
          expect(response).to have_http_status(200)
          expect(response).not_to redirect_to(new_payment_method_path)
        end
      end
    end
  end
end
