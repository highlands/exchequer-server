require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  context 'Authenticated' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'GET add_payment_method' do
      it 'adds a payment method' do
        get :add
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET payment_method_added' do
      it 'callbacks when adding a new payment method' do
        get :added
        expect(response).to have_http_status(:success)
      end
    end
  end
end
