class Spinach::Features::AddingAPaymentMethod < Spinach::FeatureSteps
  include CommonSteps::Login
  include CommonSteps::Pages

  step 'I click on Purchase link' do
    click_on('Purchase')
  end

  step 'I should see the payment form' do
    page.has_css?('form.payment-form')
    expect(page).to have_content('Name on Card')
    expect(page).to have_content('Card Number')
    expect(page).to have_content('Expiration Date')
    expect(page).to have_content('CVV')
  end

  step 'I click Add a Payment Method' do
    click_on('Add a Payment Method')
  end
end
