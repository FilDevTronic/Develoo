Rails.application.routes.draw do
  devise_for :users

  root 'pages#landing'

  get 'pages/landing', as: 'welcome'

  get 'pages/contact', as: 'contact'

  get 'pages/faq', as: 'faq'

  resources :profiles
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :messages, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
