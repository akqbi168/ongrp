Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :stores, only: [:index, :new, :edit, :create, :update]
  resources :staffs, only: [:index, :show, :new, :edit, :create, :update]
  resources :reports, only: [:index, :show, :new, :edit, :create, :update]
  get 'reports_temp', to: 'reports#index_temp'
  resources :cases
  resources :jobs

  root 'homes#top'

end
