class ApplicationController < ActionController::Base
  include HighlandsAuth::ApplicationHelper
  protect_from_forgery with: :exception
  # Offer exceptions
  rescue_from Offer::DueOnExpired, with: :flash_and_redirect
  rescue_from Offer::DeferrableNotAllowed, with: :flash_and_redirect
  # LineItem exceptions
  rescue_from LineItem::CouponNotInFullPrice, with: :flash_and_redirect
  # PaymentMethod exceptions
  rescue_from PaymentMethod::NoPaymentMethod, with: :flash_and_redirect
  # Spreedly Exceptions
  rescue_from Spreedly::TransactionCreationError, with: :flash_and_redirect

  def flash_and_redirect(exception)
    flash[:error] = exception.message
    redirect_to_checkout_path
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
end
