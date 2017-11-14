require 'acceptance_helper'

resource 'Offers' do
  let(:authentication) { nil }
  let!(:app) { FactoryGirl.create(:app) }

  header 'Content-Type', 'application/json'
  header 'Authentication', :authentication

  context 'Authenticated' do
    before do
      FactoryGirl.create(:api_key, auth_token: Faker::Crypto.sha1, app: app)
      FactoryGirl.create(:offer, app: app)
    end

    let(:authentication) { app.api_keys.first.auth_token }

    get '/api/v1/offers' do
      example 'Get offers' do
        do_request
        offers = JSON.parse(response_body)
        expect(offers.first.keys).to eq %w[name]
        expect(status).to eq(200)
      end
    end
  end
end
