class OfferSerializer < ApplicationSerializer
  attributes %i[manager id name description due_on amount deferrable created_at updated_at]
end
