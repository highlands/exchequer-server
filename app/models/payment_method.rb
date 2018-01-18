class PaymentMethod < ApplicationRecord
  # A Payment Method is the way the User can make payments towards an offer
  NoPaymentMethod = Class.new(StandardError)

  acts_as_paranoid without_default_scope: true

  belongs_to :user

  validates :token, uniqueness: true
  validates :card_type, presence: true
  validates :last_four_digits, presence: true

  def to_s
    "#{display_card_type} - #{last_four_digits}"
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def display_card_type
    case card_type
    when 'visa'
      'Visa'
    when 'american_express'
      'American Express'
    when 'mastercard'
      'MasterCard'
    when 'discover'
      'Discover'
    when 'diners_club'
      'Diners Club'
    when 'jcb'
      'JCB'
    when 'dankort'
      'Dankort'
    when '3d_secure_enrolled'
      '3D Secure Enrolled'
    when 'third_party_vault'
      'Third Party Vault'
    else
      'Other'
    end
  end
end
