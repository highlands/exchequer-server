class PaymentMethod < ApplicationRecord
  belongs_to :user
  validates :token, uniqueness: true
  validates :card_type, presence: true
  validates :last_four_digits, presence: true
end
