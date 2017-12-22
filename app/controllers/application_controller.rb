class ApplicationController < ActionController::Base
  include HighlandsAuth::ApplicationHelper
  protect_from_forgery with: :exception

  # FIXME: lets move these rescues into their proper controllers, or into interactors for checkout
  # Checkout exceptions
  rescue_from Checkout::TransactionError, with: :flash_and_redirect
  # Coupon exceptions
  rescue_from Coupon::NotFound, with: :flash_and_redirect
  # Offer exceptions
  rescue_from Offer::DueOnExpired, with: :flash_and_redirect
  rescue_from Offer::DeferrableNotAllowed, with: :flash_and_redirect
  # LineItem exceptions
  rescue_from LineItem::CouponNotInFullPrice, with: :flash_and_redirect
  # PaymentMethod exceptions
  rescue_from PaymentMethod::NoPaymentMethod, with: :flash_and_redirect
  # Spreedly Exceptions
  rescue_from Spreedly::TransactionCreationError, with: :flash_and_redirect

  before_action :set_manager

  def flash_and_redirect(exception)
    flash[:error] = exception.message
    redirect_to_invoice_path
  end

  def authenticate_admin!
    redirect_to auth.new_session_path unless current_user.try(:admin?)
  end

  def authenticate_user!
    redirect_to auth.new_session_path unless current_user
  end

  def redirect_to_checkout_path
    redirect_to new_checkout_path(offer_id: @offer)
  end

  def redirect_to_invoice_path
    redirect_to invoice_path(@invoice)
  end

  def set_manager
    # FIXME: implement here? this is set from a parameter, but then we should save it in the session
    # and use that until another manager param comes through. Use token not id.
  end

  def set_redirect_path
    session[:from] = params
  end
end
