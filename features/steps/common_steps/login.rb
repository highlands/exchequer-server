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
  end
end
