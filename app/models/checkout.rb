class Checkout
  class << self
    def with_coupon(invoice, offer, coupon)
      LineItem.create_line_item_for_coupon(invoice, offer, coupon)
    end

    def without_coupon(invoice, amount, payment_token)
      SpreedlyTransaction.purchase(invoice, amount, payment_token)
    end
  end
end
