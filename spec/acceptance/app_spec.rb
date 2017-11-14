require 'acceptance_helper'

resource 'App' do
  context 'Unauthenticated' do
    get '/api/v1/app/me' do
      example 'Showing Current App' do
        do_request
        expect(status).to eq 401
      end
    end
  end

  context 'Authenticated' do
    let(:offer)
    get '/api/v1/app/me' do
      example 'Showing Current App' do
        do_request
        expect(response.keys).to eq %w[id application completion_content sections questions]
        expect(status).to eq(401)
      end
    end
  end
end
