class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @vault = Vault.env
  end

  def create
    @error = params[:error]
    token = params[:token]
    unless @error
      PaymentMethod.create(user: current_user, token: token) unless @error
      flash[:success] = 'Payment method added'
      redirect_to RedirectionManager.path_for(session[:from])
    end
  end
end
