module CommonSteps
  module Login
    include Spinach::DSL

    EMAIL = ENV['HIGHLANDS_SSO_EMAIL']
    PASSWORD = ENV['HIGHLANDS_SSO_PASSWORD']

    step 'I am logged in' do
      visit 'offers/'
      fill_in 'user_username', with: EMAIL
      fill_in 'user_password', with: PASSWORD
      click_on('Sign In')
    end

    step 'I am logged in with a Payment Method' do
      visit 'offers/'
      fill_in 'user_username', with: EMAIL
      fill_in 'user_password', with: PASSWORD
      click_on('Sign In')
      user = User.find_by(email: ENV['HIGHLANDS_SSO_EMAIL'])
      user.payment_methods << FactoryGirl.create(:payment_method, token: Rails.application.secrets.payment_method_test_token, user: user)
      user.save!
    end
  end
end
