class InvoicesController < ApplicationController
  before_action :check_path
  before_action :authenticate_user!

  def new
    offer = Offer.find(params[:offer_id])
    invoice = Invoice.create_with_due_on_for(offer, current_user)
    redirect_to invoice_path(invoice)
  end

  def show
    @invoice = current_user.invoices.find(params[:id])
    @offer = @invoice.offer
    @payment_methods = current_user.available_payment_methods
    @balance_remaining = @invoice.balance_remaining
  end

  def check_path
    # FIXME: lets move this to application controll and rename to set_redirect_path
    session[:from] = params
  end
end
