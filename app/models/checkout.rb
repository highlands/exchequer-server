class Checkout
  TransactionError = Class.new(StandardError)
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :invoice, :coupon, :amount, :offer, :payment_method_id, :user

  validates :offer, presence: true
  validates :user, presence: true
  validates :invoice, presence: true

  def initialize(*args)
    super
    validate_due_on_and_deferrable
    validate!
  end

  def pay
    ActiveRecord::Base.transaction do
      LineItem.create_or_find_for_offer(@invoice, @offer)

      @coupon ? with_coupon : without_coupon
    end
  end

  def with_coupon
    LineItem.create_or_find_for_coupon(@invoice, @coupon)
    "You've just used your coupon"
  end

  def without_coupon
    validate_payment_method
    SpreedlyTransaction.purchase(@invoice, @amount, @payment_method)
    "You've just paid for this offer"
  end

  def validate_payment_method
    @payment_method = @user.payment_methods.find_by(id: @payment_method_id)
    unless @payment_method
      raise PaymentMethod::NoPaymentMethod,
        "You're trying to use a payment method that doesn't belong to you"
    end
  end

  def validate_due_on_and_deferrable
    if Time.zone.now > @offer.due_on
      raise Offer::DueOnExpired, 'This offer cannot be paid anymore.'
    end

    unless @offer.deferrable
      if @amount.to_d < @offer.amount
        raise Offer::DeferrableNotAllowed, 'You cannot make a partial payment towards this offer'
      end
    end
  end
end
