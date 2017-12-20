# FIXME make this into a service and move into service folder, move the checkout controller logic
# into it. Maybe consider making this an Active Model (in the models folder) -- but a non AR model.
class Checkout
  class << self
    # FIXME: turn these methods into def self.foo
    def pre_validation(offer, amount)
      if Time.zone.now > offer.due_on
        raise Offer::DueOnExpired, 'This offer cannot be paid anymore.'
      end

      unless offer.deferrable
        if amount.to_d < offer.amount
          raise Offer::DeferrableNotAllowed, 'You cannot make a partial payment towards this offer'
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
