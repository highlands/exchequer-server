ActiveAdmin.register Manager do
  permit_params do
    %i[name public_token]
  end
end
