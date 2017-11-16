ActiveAdmin.register PaymentMethod do
  permit_params do
    %i[user_id token]
  end
end
