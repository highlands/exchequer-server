require 'rails_helper'

RSpec.describe RedirectionManager, type: :model do
  describe '.path_for' do
    let(:params) { { "controller": 'invoices', "id": 1 } }

    context 'redirecting to the invoices controller' do
      it 'redirects to /invoices/1' do
        redirected_path = RedirectionManager.path_for(params)
        expect(redirected_path).to eq('/invoices/1')
      end
    end
  end
end
