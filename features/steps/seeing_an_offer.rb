class Spinach::Features::SeeingAnOffer < Spinach::FeatureSteps
  include CommonSteps::Login
  include CommonSteps::Pages

  step 'I should see the Create Invoice link' do
    expect(page).to have_content('Create Invoice')
  end

  step 'I should see I dont have any invoice yet' do
    expect(page).to have_content("You don't have any invoice for this Offer")
  end

  step 'I click on Create Invoice link' do
    click_on('Create Invoice')
  end

  step 'I should be redirected to' do
    expect(page.current_path).to include('invoices')
  end
end
