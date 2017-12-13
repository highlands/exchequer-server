class Spinach::Features::BuyingAnOffer < Spinach::FeatureSteps
  include CommonSteps::Login

  step 'I am in the checkout page' do
    FactoryGirl.create(:offer)
    visit '/checkouts/new?offer_id=1'
    expect(page).to have_content('Buy an Offer')
  end

  step 'I should see make payment button' do
    # FIXME: Check for button css
    expect(page).to have_content('Make Payment')
  end

  step 'I should see the apply coupon button' do
    # FIXME: Check for button css
    expect(page).to have_content('Apply Coupon')
  end

  step 'I fill out the amount I want to pay' do
    fill_in 'amount', with: 100
  end

  step 'I click Make Payment' do
    click_on('Make Payment')
  end

  step 'I should be redirected to choose my Payment Method' do
    expect(page).to have_content('Add PaymentMethod Form')
  end

  step 'I should see the payment form' do
    pending 'check why the spreedly form is not being loaded' do
      fill_in('full_name', with: 'Josh Adams')
      fill_in('card_number', with: '4111111111111111')
      fill_in('cvv', with: '1234')
      fill_in('month', with: '10')
      fill_in('year', with: '2030')
      click_on('Add card')
    end
  end
end
