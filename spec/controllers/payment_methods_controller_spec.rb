require 'rails_helper'

RSpec.describe PaymentMethodsController, type: :controller do
  context 'Authenticated' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    describe 'GET new' do
      it 'renders the page to add a new payment method' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end
end
