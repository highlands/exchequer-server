ActiveAdmin.register Manager do
  permit_params do
    %i[name public_token]
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :public_token unless f.object.new_record?
    end
    f.actions
  end
end
