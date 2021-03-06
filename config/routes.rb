Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    confirmations: 'confirmations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#welcome'
  resources :contact, only: [:new, :create]
  resources :posts
  get 'about', to: 'pages#about'
end
