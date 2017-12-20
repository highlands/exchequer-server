class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    find_invoice
    line_item = @invoice.line_items.find(params[:id])
    line_item.destroy
    flash[:success] = 'Coupon removed'

    redirect_back(fallback_location: root_path)
  end

  private

  def find_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
