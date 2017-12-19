class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    @offers = Manager.first.offers
  end

  def show
    @offer = Offer.find(params[:id])
    @invoices = Invoice.where(offer: @offer, user: current_user)
  end
end
