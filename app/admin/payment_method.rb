ActiveAdmin.register PaymentMethod do
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :token
      f.input :user,
        as: :searchable_select,
        collection: User.all,
        member_label: proc { |user| user.email.to_s }
    end
    f.actions
  end

  permit_params do
    %i[user_id token]
  end
end
