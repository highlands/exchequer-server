class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    token = params[:payment_method_token]
    card_type = params[:card_type]
    last_four_digits = params[:last_four_digits]
    PaymentMethod.create(
      user: current_user,
      token: token,
      card_type: card_type,
      last_four_digits: last_four_digits
    )
    flash[:success] = 'Payment method added'
    redirect_to RedirectionManager.path_for(session[:from])
  end
end
