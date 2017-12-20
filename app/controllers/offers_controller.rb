class OffersController < ApplicationController
  before_action :check_path
  before_action :authenticate_user!

  def index
    # FIXME: set manager from Application Controller
    @offers = Manager.first.offers
  end

  def show
    @offer = Offer.find(params[:id])
    @invoices = Invoice.where(offer: @offer, user: current_user)
  end

  def check_path
    session[:from] = params
  end
end
