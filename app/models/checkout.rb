class Checkout
  class << self
    def with_coupon(invoice, coupon)
      LineItem.create_or_find_for_coupon(invoice, coupon)
    end

    def without_coupon(invoice, amount, payment_token)
      SpreedlyTransaction.purchase(invoice, amount, payment_token)
    end
  end
end
