module CommonSteps
  module Pages
    include Spinach::DSL

    step 'I am in the checkout page' do
      FactoryGirl.create(:offer, due_on: Time.zone.now + 3.days, deferrable: true)
      visit '/checkouts/new?offer_id=1'
      expect(page).to have_content('Buy an Offer')
    end

    step 'I am in the checkout page seeing an expired offer' do
      FactoryGirl.create(:offer, due_on: Time.zone.now - 3.days, deferrable: true)
      visit '/checkouts/new?offer_id=1'
      expect(page).to have_content('Buy an Offer')
    end

    step 'I am in the checkout page seeing an undeferrable offer whose amount is 100' do
      FactoryGirl.create(:offer, amount: 100, due_on: Time.zone.now + 3.days, deferrable: false)
      visit '/checkouts/new?offer_id=1'
      expect(page).to have_content('Buy an Offer')
    end

    step 'I should be redirected to add a Payment Method' do
      expect(page).to have_content('Add PaymentMethod Form')
    end

    step 'I should be redirected to choose a Payment Method' do
      expect(page).to have_content('Choose your card')
    end

    step 'I should be redirected to the Offer page' do
      expect(page).to have_content('Buy an Offer')
    end
  end
end
