class OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_redirect_path

  def index
    # FIXME: set manager from Application Controller
    @offers = Manager.first.offers
  end

  def show
    @offer = Offer.find(params[:id])
    @invoices = Invoice.where(offer: @offer, user: current_user)
  end
end
