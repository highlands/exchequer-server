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

    describe 'GET added - callback from spreedly' do
      context 'when there are no errors in the card addition' do
        before do
          allow(RedirectionManager).to receive(:path_for).and_return('/')
        end

        it 'redirects to where RedirectionManager.path_for says' do
          get :added
          expect(response).to have_http_status(302)
          expect(response).to redirect_to('/')
        end
      end

      context 'when there are errors in the card addition' do
        before do
          allow(RedirectionManager).to receive(:path_for).and_return('/')
          allow(controller).to receive(:params).and_return(error: 'error')
        end

        it 'renders added page' do
          get :added
          expect(response).to have_http_status(200)
          expect(response).to render_template('payment_methods/added')
        end
      end
    end
  end
end
