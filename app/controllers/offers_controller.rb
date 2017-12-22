class OffersController < ApplicationController
  before_action :authenticate_user!

  def index
    # FIXME: set manager from Application Controller
    @offers = Manager.first.offers
  end

  def show
    @offer = Offer.find(params[:id])
    @invoices = Invoice.where(offer: @offer, user: current_user)
  end
end
