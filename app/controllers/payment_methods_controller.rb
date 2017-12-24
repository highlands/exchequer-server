class PaymentMethodsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    PaymentMethod.create(
      payment_method_params.merge(user: current_user)
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

  private

  def payment_method_params
    params.permit %i[token card_type last_four_digits]
  end
end
