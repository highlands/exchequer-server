class CheckoutsController < ApplicationController
  before_action :check_path

  def new
    # If user has no payment method yet
    # redirect to payment method
    # once the payment method is added, go back to buy and have the offer_id as
    # params
    redirect_to(new_payment_method_path) && return unless current_user.payment_method_present?
    @offer = Offer.find_by(id: params[:offer_id])
    @invoice = Invoice.find_or_create_for(@offer, current_user)

    @balance_remaining = @invoice.balance_remaining
  end

  def create
    ActiveRecord::Base.transaction do
      find_offer_and_coupon
      invoice = Invoice.find_or_create_for(@offer, current_user)

      LineItem.create_if_necessary_for(invoice, @offer, @coupon)

      checkout_without_coupon(invoice) unless @coupon

      redirect_to new_checkout_path(offer_id: @offer)
    end
  end

  private

  def checkout_without_coupon(invoice)
    SpreedlyTransaction.purchase(invoice, params[:amount], payment_token)
    flash[:success] = "You've just paid for this offer"
  end

  def find_offer_and_coupon
    @offer = Offer.find(params[:offer_id])
    coupon_name = params[:coupon]
    @coupon = Coupon.find_by(name: coupon_name, offer: @offer)
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
