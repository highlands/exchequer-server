class OfferSerializer < ApplicationSerializer
  attributes %i[id name description due_on amount deferrable created_at updated_at]
  belongs_to :manager
end
