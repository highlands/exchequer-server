Rails.application.routes.draw do
  # PaymentMethod
  get 'payments/add', as: :add_payment
  get 'payments/added', as: :payment_added

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }
  root to: "visitor#index"
end
