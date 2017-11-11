require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  context 'Authenticated' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'GET buy' do
      context 'WHEN user has NOT payments methods' do
        it 'adds a payment method' do
          get :buy
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(add_payment_path)
        end
      end

      context 'WHEN user HAS payments methods' do
        before do
          allow(user).to receive(:payment_methods?).and_return(true)
        end

        it 'adds a payment method' do
          get :buy
          expect(response).to have_http_status(200)
          expect(response).not_to redirect_to(add_payment_path)
        end
      end
    end
  end
end
