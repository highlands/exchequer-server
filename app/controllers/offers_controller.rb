class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
    @invoices = Invoice.where(offer: @offer, user: current_user)
  end
end
