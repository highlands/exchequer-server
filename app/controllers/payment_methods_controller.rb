class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    token = params[:payment_method_token]
    PaymentMethod.create(user: current_user, token: token)
    flash[:success] = 'Payment method added'
    redirect_to RedirectionManager.path_for(session[:from])
  end
end
