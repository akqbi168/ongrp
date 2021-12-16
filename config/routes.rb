Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :stores, only: [:index, :new, :edit, :create, :update, :destroy]
  resources :staffs
  resources :reports
  get 'reports_temp', to: 'reports#index_temp'
  resources :cases, only: [:index, :new, :edit, :create, :update, :destroy]
  # resources :scores, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  resources :jobs, only: [:index, :new, :edit, :create, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :payments, only: [:index, :edit, :create, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :ranks, only: [:index, :new, :edit, :create, :update]
  resources :bounties, only: [:index, :new, :edit, :create, :update]

  get 'about', to: 'homes#about'
  get 'history', to: 'homes#history'
  root 'homes#top'

end
