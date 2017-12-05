ActiveAdmin.register Coupon do
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :offer,
        as: :searchable_select,
        collection: Offer.all,
        member_label: proc { |offer| offer.name.to_s }
      f.input :name
      f.input :code
      f.input :percent_off
      f.input :amount_off
    end
    f.actions
  end

  permit_params do
    %i[offer_id name percent_off amount_off code]
  end
end
