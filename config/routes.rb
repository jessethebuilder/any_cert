Cert::Application.routes.draw do
  resources :services

  resources :certificates

  resources :stores, :only => [:new, :create]

  #devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks'}
  #get 'facebook_callback', :to => 'omniauth_callbacks#facebook', :as => 'facebook_callback'
  devise_for :users#, :only => :omniauth_callbacks

  #get 'users/auth/:provider/callback' => 'authentications#create'
  #post 'users/auth/:provider/callback' => 'authentications#create'
  #get '/auth/:provider/signout' => 'authentications#signout'
  #post '/auth/:provider/signout' => 'authentications#signout'

  get 'users/auth/:provider/callback' => 'authentications#facebook_callback'

  #mount FarmTools::Engine, :at => 'address'

  #debug
  get 'test', :to => 'tests#fb', :as => 'test'

  root 'certificates#new'
  #root :to => 'tests#fb'
end

