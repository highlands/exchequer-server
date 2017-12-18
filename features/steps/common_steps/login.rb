module CommonSteps
  module Login
    include Spinach::DSL

    EMAIL = ENV['HIGHLANDS_SSO_EMAIL']
    PASSWORD = ENV['HIGHLANDS_SSO_PASSWORD']

    step 'I am logged in' do
      # FIXME: Mock the login via SSO
      visit 'checkouts/new?offer_id=1'
      fill_in 'user_username', with: EMAIL
      fill_in 'user_password', with: PASSWORD
      click_on('Sign In')
    end

    step 'I am logged in with a Payment Method' do
      # FIXME: Mock the login via SSO
      visit 'checkouts/new?offer_id=1'
      fill_in 'user_username', with: EMAIL
      fill_in 'user_password', with: PASSWORD
      click_on('Sign In')
      user = User.find_by(email: ENV['HIGHLANDS_SSO_EMAIL'])
      user.payment_methods << FactoryGirl.create(:payment_method, token: ENV['PAYMENT_METHOD_TEST_TOKEN'], user: user)
      user.save!
    end
  end
end
