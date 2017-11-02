Rails.application.routes.draw do
  get 'payments/form'
  get 'payments/payment_method_added'

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }
  root to: "visitor#index"
end
