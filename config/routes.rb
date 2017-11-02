Rails.application.routes.draw do
  # PaymentMethod
  get 'payments/add_payment_method'
  get 'payments/payment_method_added'

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }
  root to: "visitor#index"
end
