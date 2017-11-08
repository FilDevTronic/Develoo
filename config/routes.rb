Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations'
                                  }

  root 'pages#landing'

  get 'pages/landing', as: 'welcome'

  get 'pages/contact', as: 'contact'

  get 'pages/faq', as: 'faq'

  get 'pages/settings', as: 'settings'

  get 'stripe/connect'

  get 'charges/thankyou'

  post 'charges', to: 'charges#create'

  resources :users, only: [ :index ]

  resources :profile, only: [ :index,
                              :edit,
                              :update,
                              :show,
                              :destroy
                            ]

  resources :conversations, only: [ :index,
                                    :show,
                                    :destroy
                                  ] do

    collection do
      delete :empty_trash
    end

    member do
      post :restore
      post :reply
      post :mark_as_read
    end

  end

  resources :messages, only: [ :new,
                               :create
                             ]

  resources :commissions

  resource :cart, only: [ :show ]

  resources :order_items, only: [ :create,
                                  :update,
                                  :destroy
                                ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
