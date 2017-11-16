ActiveAdmin.register User do
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email
      f.input :admin
      f.input :password
    end
    f.actions
  end
  permit_params do
    %i[email admin password]
  end
end
