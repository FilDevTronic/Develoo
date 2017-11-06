Rails.application.routes.draw do
  resources :user_stories
  devise_for :users, controllers: {sessions: 'users/sessions'}

  root 'pages#landing'

  get 'pages/landing', as: 'welcome'

  get 'pages/contact', as: 'contact'

  get 'pages/faq', as: 'faq'

  resources :users, only: [:index]

  resources :profile, only: [:index, :edit, :update, :show, :destroy]

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :mark_as_read
    end
  end

  resources :messages, only: [:new, :create]

  resources :commissions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
