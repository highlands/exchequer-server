class Checkout
  class << self
    def pre_validation(offer, amount)
      if Time.zone.now > offer.due_on
        raise Offer::DueOnExpired, 'This offer cannot be paid anymore.'
      end

      unless offer.deferrable
        if amount.to_d < offer.amount
          raise Offer::DeferrableNotAllowed, 'Deferrable is not allowed for this offer.'
        end
      end
    end

    def with_coupon(invoice, coupon)
      LineItem.create_or_find_for_coupon(invoice, coupon)
    end

    def without_coupon(invoice, amount, payment_token, payment_method)
      SpreedlyTransaction.purchase(invoice, amount, payment_token, payment_method)
    end
  end
end
