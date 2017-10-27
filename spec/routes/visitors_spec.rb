require 'rails_helper'

RSpec.describe 'routes for Visitors', type: :routing do
  it 'routes / to the visitor controller' do
    expect(get('/')).to route_to('visitor#index')
  end
end
