class CheckoutsController < ApplicationController
  before_action :check_path

  def create
    # If user has no payment method yet
    # redirect to payment method
    # once the payment method is added, go back to buy and have the offer_id as
    # params
    find_offer_and_coupon
    redirect_to(new_payment_method_path) && return unless current_user.payment_method_present? || @coupon

    Checkout.pre_validation(@offer, params[:amount])

    ActiveRecord::Base.transaction do
      LineItem.create_or_find_for_offer(@invoice, @offer)

      @coupon ? checkout_with_coupon : checkout_without_coupon

      redirect_to @invoice
    end
  end

  private

  def checkout_with_coupon
    Checkout.with_coupon(@invoice, @coupon)
    flash[:success] = "You've just used your coupon"
  end

  def checkout_without_coupon
    payment_method = current_user.payment_methods.find_by(id: params[:payment_method_id])
    unless payment_method
      raise PaymentMethod::NoPaymentMethod,
        "You're trying to use a payment method that doesn't belong to you"
    end
    Checkout.without_coupon(@invoice, params[:amount], payment_token, payment_method)
    flash[:success] = "You've just paid for this offer"
  end

  def find_offer_and_coupon
    @invoice = Invoice.find(params[:invoice_id])
    # raise an exception here when the offer does not exist
    @offer = Offer.find(params[:offer_id])
    coupon_code = params[:coupon]
    @coupon = Coupon.find_by(code: coupon_code.try(:downcase), offer: @offer)
    raise Coupon::NotFound, 'This coupon does not exist' if coupon_code && !@coupon
  end

  def payment_token
    # TODO: The user should choose the payment method
    current_user.payment_methods.first.token
  end

  def check_path
    session[:from] = params
    authenticate_user!
  end
end
