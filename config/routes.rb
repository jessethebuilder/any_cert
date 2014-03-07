Cert::Application.routes.draw do
  resources :services

  resources :certificates

  resources :stores, :only => [:new, :create]

  devise_for :users, :controller => {:omniauth_callbacks => 'omniauth_callbacks'}

  #mount FarmTools::Engine, :at => 'address'

  root 'certificates#new'
end
