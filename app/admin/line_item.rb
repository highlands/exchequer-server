ActiveAdmin.register LineItem do
  permit_params do
    %i[invoice_id quantity amount offer_id coupon_id]
  end
end
