class CheckoutsController < ApplicationController
  before_action :check_path

  def new
    # If user has no payment method yet
    # redirect to payment method
    # once the payment method is added, go back to buy and have the offer_id as
    # params
    redirect_to(new_payment_method_path) && return unless current_user.payment_method_present?
    @offer = Offer.find_by(id: params[:offer_id])
  end

  def create
    # For the payment token
    # Should I get always the first payment token the user has?
    payment_token = current_user.payment_methods.first.token
    offer = Offer.find(params[:offer_id])
    amount = params[:amount]

    # We are retaining the payment method on success
    # because this is not the default from spreedly
    transaction = spreedly_env.purchase_on_gateway(Rails.application.secrets.gateway_token,
      payment_token,
      200,
      retain_on_success: true)
    if transaction.succeeded?
      ActiveRecord::Base.transaction do
        # It creates an invoice if there is not
        # and after this it passes the invoice id
        # to the payment
        invoice = Invoice.find_or_create_by(offer: offer,
                                            user: current_user,
                                            due_on: offer.due_on || Time.zone.now)

        # TODO: Handle LineItem

        Payment.create(invoice: invoice, amount: amount)
        flash[:success] = "You've just paid for this offer"
      end
    else
      flash[:error] = 'Something went wrong.'
    end

    redirect_to new_checkout_path(offer_id: offer)
  end

  private

  def check_path
    session[:from] = params
    authenticate_user!
  end
end
