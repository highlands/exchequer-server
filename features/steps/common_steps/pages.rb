module CommonSteps
  module Pages
    include Spinach::DSL

    step 'I am on an offer page' do
      offer_name = 'Offer Name'
      FactoryGirl.create(:offer, name: offer_name, id: 1, due_on: Time.zone.now + 3.days, deferrable: true)
      visit '/offers/1'
      expect(page).to have_content(offer_name)
    end

    step 'I am on an offer page from an undeferrable offer' do
      offer_name = 'Offer Name'
      offer = FactoryGirl.create(:offer, name: offer_name, id: 1, due_on: Time.zone.now + 3.days, deferrable: false)
      visit "/offers/#{offer.id}"
      expect(page).to have_content(offer_name)
    end

    step 'I am on the invoice page' do
      expect(page).to have_content('Invoice:')
    end

    step 'I am on the checkout page seeing an expired offer' do
      FactoryGirl.create(:offer, due_on: Time.zone.now - 3.days, deferrable: true)
      visit '/checkouts/new?offer_id=1'
      expect(page).to have_content('Buy an Offer')
    end

    step 'I should be redirected to add a Payment Method' do
      expect(page).to have_content('Add Payment Method')
    end

    step 'I should be redirected to the Offer page' do
      # FIXME: I don't think this is correct!
      expect(page).to have_content('Invoice: ')
    end
  end
end
