class LineItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    # We currently don't support deleting offer line items, only coupons, so this is tied to coupons
    # only.
    find_invoice
    line_item = @invoice.line_items.discounts.find(params[:id])
    line_item.destroy
    flash[:success] = 'Coupon removed'

    redirect_back(fallback_location: root_path)
  end

  private

  def find_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
