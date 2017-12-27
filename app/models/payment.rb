class Payment < ApplicationRecord
  # A Payment is a single monetary transaction spent towards an invoice

  belongs_to :invoice
  belongs_to :payment_method

  validates :invoice, presence: true
  validates :amount, presence: true
  validates :transaction_token, presence: true
end
