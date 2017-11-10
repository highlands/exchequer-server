class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def add
    @vault = Vault.env
  end

  def added
    @error = params[:error]
    @token = params[:token]
    PaymentMethod.create(user: current_user, token: @token) unless @error
  end
end
