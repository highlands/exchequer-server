# FIXME: switch to strong params
class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    # FIXME: we can drop the assignment with strong params
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

  def destroy
    begin
      payment_method = current_user.payment_methods.find(params[:id])
      payment_method.destroy
      flash[:success] = 'Payment method deleted'
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "We couldn't find this payment method"
    end
    redirect_back(fallback_location: root_path)
  end
end
