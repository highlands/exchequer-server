ActiveAdmin.register Offer do
  permit_params do
    %i[manager_id description name due_on amount deferrable]
  end
end
