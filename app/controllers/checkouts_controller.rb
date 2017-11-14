class CheckoutsController < ApplicationController
  before_action :check_path

  def create
    # If user has no payment method yet
    # redirect to payment method
    # once the payment method is added, go back to buy and have the offer_id as
    # params
    redirect_to(add_payment_path) && return unless current_user.payment_methods?
    @offer = Offer.find_by(id: params[:offer_id])
  end

  private

  def check_path
    session[:from] = params
    authenticate_user!
  end
end
