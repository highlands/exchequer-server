class PaymentsController < ApplicationController
  def add_payment_method
    @vault = Vault.env
  end

  def payment_method_added
    @error = params[:error]
    @token = params[:token]
  end
end
