class Spinach::Features::SeeingAnOffer < Spinach::FeatureSteps
  include CommonSteps::Login
  include CommonSteps::Pages

  step 'I should see the Purchase link' do
    expect(page).to have_content('Purchase')
  end

  step 'I should see I dont have an invoice yet' do
    expect(page).to have_content("You haven't purchased this offer.")
  end

  step 'I click on Purchase link' do
    click_on('Purchase')
  end

  step 'I should be redirected to my invoices' do
    expect(page.current_path).to include('invoices')
  end
end
