require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe 'GET #form' do
    it 'returns http success' do
      get :form
      expect(response).to have_http_status(:success)
    end
  end
end
