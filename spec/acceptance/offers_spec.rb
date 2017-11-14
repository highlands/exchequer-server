require 'acceptance_helper'

resource 'Offers' do
  let(:authentication) { nil }
  let!(:manager) { FactoryGirl.create(:manager) }

  header 'Content-Type', 'application/json'
  header 'Authentication', :authentication

  context 'Authenticated' do
    before do
      FactoryGirl.create(:api_key, auth_token: Faker::Crypto.sha1, manager: manager)
      FactoryGirl.create(:offer, manager: manager)
    end

    let(:authentication) { manager.api_keys.first.auth_token }

    get '/api/v1/offers' do
      example 'Get offers' do
        do_request
        offers = JSON.parse(response_body)
        expect(offers.first.keys).to eq %w[manager id name description due_on amount deferrable created_at updated_at]
        expect(status).to eq(200)
      end
    end
  end
end
