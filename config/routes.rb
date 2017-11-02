Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }
  root to: "visitor#index"
end
