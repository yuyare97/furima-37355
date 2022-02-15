Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'furima/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :show] do
  end
end
