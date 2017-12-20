ActiveAdmin.register Manager do
  permit_params do
    %i[name]
  end
end
