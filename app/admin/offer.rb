ActiveAdmin.register Offer do
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :manager,
        as: :searchable_select,
        collection: Manager.all,
        member_label: proc { |manager| manager.name.to_s }
      f.input :description
      f.input :name
      f.input :due_on
      f.input :amount
      f.input :deferrable
    end
    f.actions
  end
  permit_params do
    %i[manager_id description name due_on amount deferrable]
  end
end
