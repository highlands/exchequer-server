Rails.application.routes.draw do
  # PaymentMethod
  resources :payment_methods, only: [:new]
  get 'payment_methods/added', as: :payment_added

  # Checkouts
  resources :checkouts

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }
  root to: "visitor#index"
  namespace :api do
    namespace :v1 do
      get 'app/me', to: 'app#me'
      resources :offers, only: [:create, :show, :index, :update]
      resources :coupons, only: [:show, :index]
      resources :invoices, only: [:show, :index]
      resources :line_items, only: [:show, :index]
      resources :payments, only: [:show, :index]
      resources :users, only: [:show]
      # PaymentMethod doesn't exist yet, waiting on the vault/spreedly
      # resources :payment_method, only: [:show, :index]
    end
  end
end
