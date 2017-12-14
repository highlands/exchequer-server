class Spinach::Features::AddingAPaymentMethod < Spinach::FeatureSteps
  include CommonSteps::Login
  include CommonSteps::Pages

  step 'I fill out the amount I want to pay' do
    pending 'step not implemented'
  end

  step 'I click Make Payment' do
    click_on('Make Payment')
  end

  step 'I should see the payment form' do
    pending 'Check how to see this'
  end
end
