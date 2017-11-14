require 'acceptance_helper'

resource 'App' do
  let(:authentication) { nil }

  header 'Content-Type', 'application/json'
  header 'Authentication', :authentication

  context 'Unauthenticated' do
    get '/api/v1/app/me' do
      example 'Showing Current App' do
        do_request
        expect(status).to eq 401
      end
    end
  end

  context 'Authenticated' do
    before do
      FactoryGirl.create(:api_key, auth_token: Faker::Crypto.sha1)
    end

    let(:authentication) { ApiKey.first.auth_token }

    get '/api/v1/app/me' do
      example 'Showing Current App' do
        do_request
        response = JSON.parse(response_body)
        expect(response.keys).to eq %w[name]
        expect(status).to eq(200)
      end
    end
  end
end
