Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'homes#top'

end
