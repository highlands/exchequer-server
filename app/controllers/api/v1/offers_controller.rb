class Api::V1::OffersController < Api::V1::ApiBaseController
  def index
    @offers = Offer.all
    render @offers
  end

  def show
    @offer = Offer.find(params[:id])
    render @offer
  end

  def update
    @offer = Offer.find(params[:id])
    render @offer
  end

  def create
    @offer = Offer.new
    render @offer
  end
end
