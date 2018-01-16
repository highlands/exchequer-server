ActiveAdmin.register ApiKey do
  permit_params do
    %i[auth_token manager_id]
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :manager
      f.input :auth_token unless f.object.new_record?
    end
    f.actions
  end
end
