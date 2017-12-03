class PaymentMethod < ApplicationRecord
  acts_as_paranoid without_default_scope: true
  belongs_to :user
  validates :token, uniqueness: true
  validates :card_type, presence: true
  validates :last_four_digits, presence: true
end
