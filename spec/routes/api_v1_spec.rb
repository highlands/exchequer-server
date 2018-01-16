require 'rails_helper'

RSpec.describe 'routes for API v1', type: :routing do
  it 'app#me should render the current application' do
    expect(get('/api/v1/app/me')).to route_to('api/v1/app#me')
  end

  it 'offer should support create, show, index and update' do
    expect(post('/api/v1/offers')).to route_to('api/v1/offers#create')
    expect(get('/api/v1/offers/1')).to route_to('api/v1/offers#show', id: '1')
    expect(get('/api/v1/offers')).to route_to('api/v1/offers#index')
    expect(put('/api/v1/offers/1')).to route_to('api/v1/offers#update', id: '1')
  end
end
