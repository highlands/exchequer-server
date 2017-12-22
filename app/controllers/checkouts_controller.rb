class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    find_offer_coupon_and_invoice
    redirect_if_no_payment_method

    checkout = Checkout.new(user: current_user,
                            payment_method_id: params[:payment_method_id],
                            offer: @offer,
                            coupon: @coupon,
                            amount: params[:amount],
                            invoice: @invoice)

    message = checkout.pay
    flash[:success] = message
    redirect_to @invoice
  end

  private

  def find_offer_coupon_and_invoice
    @invoice = Invoice.find(params[:invoice_id])
    # raise an exception here when the offer does not exist
    @offer = Offer.find(params[:offer_id])
    coupon_code = params[:coupon]
    @coupon = Coupon.find_by(code: coupon_code.try(:downcase), offer: @offer)
    raise Coupon::NotFound, 'This coupon does not exist' if coupon_code && !@coupon
  end

  def redirect_if_no_payment_method
    # If user has no payment method yet redirect to payment method once the payment method is added,
    # go back to buy and have the offer_id as params
    redirect_to(new_payment_method_path) unless payment_method_or_coupon
  end

  def payment_method_or_coupon
    current_user.payment_method_present? || @coupon
  end
end
