Rails.application.routes.draw do
  get 'visitors/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'visitors#index'
  get 'homepage' => 'visitors#index'
end
