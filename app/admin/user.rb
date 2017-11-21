ActiveAdmin.register User do
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email
      f.input :admin
    end
    f.actions
  end
  permit_params do
    %i[email admin]
  end
end
