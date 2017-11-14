require 'rails_helper'

RSpec.describe RedirectionManager, type: :model do
  describe '.path_for' do
    let(:params) { { "controller": 'checkouts', "offer_id": 1 } }

    context 'redirecting in the checkouts controller' do
      it 'redirects to /checkout containing the offer id' do
        redirected_path = RedirectionManager.path_for(params)
        expect(redirected_path).to eq('/checkouts/new?offer_id=1')
      end
    end
  end
end
