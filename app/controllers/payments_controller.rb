class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def add_payment_method
    @vault = Vault.env
  end

  def payment_method_added
    @error = params[:error]
    @token = params[:token]
    PaymentMethod.create(user: current_user, token: @token) unless @error
  end
end
