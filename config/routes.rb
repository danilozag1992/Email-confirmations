Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    confirmations: 'confirmations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
  resources :contact, only: [:index, :new, :create]
  resources :posts
end
