class PaymentsController < ApplicationController
  def form
    @vault = Vault.env
  end

  def payment_method_added
    @token = params[:token]
  end
end
