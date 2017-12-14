class Spinach::Features::ApplyingACoupon < Spinach::FeatureSteps
  include CommonSteps::Login
  include CommonSteps::Pages

  step 'I fill in my coupon code' do
    fill_in 'coupon', with: 'TEST'
  end

  step 'I have a valid coupon code' do
    offer = Offer.find(1)
    offer.coupons << FactoryGirl.create(:coupon, name: 'TEST', code: 'TEST', percent_off: 0.5)
    offer.save!
  end

  step 'I should see the apply coupon button' do
    expect(page).to have_content('Apply Coupon')
  end

  step 'I click Apply Coupon' do
    click_on('Apply Coupon')
  end

  step 'I should see a message saying my coupon was applied' do
    expect(page).to have_content("You've just used your coupon")
  end

  step 'I should see the coupon applied in my invoice' do
    offer = Offer.find(1)
    expect(page).to have_content("#{offer.name} - Coupon")
  end

  step 'I should see a message saying my coupon does not exist' do
    expect(page).to have_content('This coupon does not exist')
  end

  step 'I have some payments for this offer' do
    user = User.find_by(email: ENV['HIGHLANDS_SSO_EMAIL'])
    invoice = Invoice.find_by(user: user, offer: Offer.find(1))
    invoice.payments << FactoryGirl.create(:payment, amount: 1, invoice: invoice)
    invoice.save!
    visit '/checkouts/new?offer_id=1'
  end

  step 'I can see in the invoice some transactions' do
    expect(page).to have_css('.payments')
  end

  step 'I should see a message saying I can only apply coupon in the full price' do
    expect(page).to have_content('You can only apply the coupon in the full price')
  end
end
