Rails.application.routes.draw do
  mount HighlandsAuth::Engine => "/highlands_sso", :as => "auth"

  # Offers
  resources :offers, only: [:index, :show]

  # Invoices
  resources :invoices, only: [:new, :show] do
    # LineItems
    resources :line_items, only: [:destroy]
  end

  # PaymentMethod
  resources :payment_methods, only: [:new, :create, :destroy]

  # Checkouts
  resources :checkouts

  resources :visitor, only: [:index]

  ActiveAdmin.routes(self)
  root to: "visitor#index"
  namespace :api do
    namespace :v1 do
      get 'app/me', to: 'app#me'
      resources :offers, only: [:create, :show, :index, :update]
    end
  end

end
