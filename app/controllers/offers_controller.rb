class OffersController < ApplicationController
  before_action :check_path

  def buy
    # If user has no payment method yet
    # redirect to payment method
    # once the payment method is added, go back to buy
  end

  def check_path
    session[:from] = params[:controller]
    authenticate_user!
  end
end
