ActiveAdmin.register ApiKey do
  permit_params do
    %i[auth_token manager_id]
  end
end
