ActiveAdmin.register Invoice do
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :offer,
        as: :searchable_select,
        collection: Offer.all,
        member_label: proc { |o| o.name.to_s }
      f.input :user,
        as: :searchable_select,
        collection: User.all,
        member_label: proc { |u| u.email.to_s }
      f.input :due_on, as: :datepicker
    end
    f.actions
  end
  permit_params do
    %i[offer_id user_id due_on]
  end
end
