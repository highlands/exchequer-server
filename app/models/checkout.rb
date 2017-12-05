class Checkout
  class << self
    def with_coupon(invoice, coupon)
      LineItem.create_or_find_for_coupon(invoice, coupon)
    end

    def without_coupon(invoice, amount, payment_token, payment_method)
      SpreedlyTransaction.purchase(invoice, amount, payment_token, payment_method)
    end
  end
end
