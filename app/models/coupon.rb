class Coupon < ApplicationRecord
  NotFound = Class.new(StandardError)
  # A coupon belongs to an offer, and discounts the total amount of that offer
  # either via a percentage (`percent_off`) or via a flat amount (`amount_off`)
  belongs_to :offer
  validates :name, presence: true
  validates :code, presence: true
  validates :offer, presence: true
  validate :ensure_discount
  validate :ensure_single_discount
  before_validation { |coupon| coupon.code.downcase! }
  before_save { |coupon| coupon.code.downcase! }

  def discounted_price
    offer_price = offer.amount

    return amount_off if amount_off
    return offer_price * percent_off
  end

  private

  def ensure_discount
    return unless [self.amount_off, self.percent_off].compact.count == 2
    errors.add(:percent_off, 'You may only have a single discount type.')
    errors.add(:amount_off, 'You may only have a single discount type.')
  end

  def ensure_single_discount
    return unless [self.amount_off, self.percent_off].compact.count.zero?
    errors.add(:percent_off, 'You must have a single discount type.')
    errors.add(:amount_off, 'You must have a single discount type.')
  end
end
