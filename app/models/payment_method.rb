class PaymentMethod < ApplicationRecord
  # A Payment Method is the way the User can make payments towards an offer
  NoPaymentMethod = Class.new(StandardError)

  acts_as_paranoid without_default_scope: true

  belongs_to :user

  validates :token, uniqueness: true
  validates :card_type, presence: true
  validates :last_four_digits, presence: true

  def to_s
    "#{card_type} - #{last_four_digits}"
  end
end
