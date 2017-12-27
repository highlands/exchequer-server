class OffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_redirect_path, only: [:show]

  rescue_from Manager::NotInSession, with: :flash_and_redirect

  def index
    if @manager
      @offers = @manager.offers
    else
      raise Manager::NotInSession, 'Please, specify the manager'
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @invoices = Invoice.where(offer: @offer, user: current_user)
  end
end
