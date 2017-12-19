module CommonSteps
  module Pages
    include Spinach::DSL

    step 'I am in the offer page' do
      offer_name = 'Offer Name'
      FactoryGirl.create(:offer, name: offer_name, id: 1, due_on: Time.zone.now + 3.days, deferrable: true)
      visit '/offers/1'
      expect(page).to have_content(offer_name)
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
      expect(page).to have_content('Add Payment Method')
      expect(page).to have_content('Name in the Card')
      expect(page).to have_content('Credit Card Number')
      expect(page).to have_content('Expiration Date')
      expect(page).to have_content('CVV')
    end

    step 'I should be redirected to the Offer page' do
      expect(page).to have_content('Buy an Offer')
    end
  end
end
