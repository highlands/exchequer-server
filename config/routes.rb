Rails.application.routes.draw do
  # PaymentMethod
  resources :payment_methods, only: [:new]
  get 'payment_methods/added', as: :payment_added

  # Checkouts
  resources :checkouts

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }
  root to: "visitor#index"
end
