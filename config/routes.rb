Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :lists, only: [ :index, :show ] do
    resources :players, only: [ :index, :new, :create ]
  end
  resources :players, only: [ :edit, :update, :destroy ]
end
