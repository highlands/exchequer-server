require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe 'GET add_payment_method' do
    it 'adds a payment method' do
      get :add_payment_method
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET payment_method_added' do
    it 'callbacks when adding a new payment method' do
      get :payment_method_added
      expect(response).to have_http_status(:success)
    end
  end
end
