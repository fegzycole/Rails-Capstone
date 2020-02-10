# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'opinions#index', as: :root
  get '/user/:id', to: 'users#show', as: :user
  get '/signup', to: 'users#new', as: :signup
  post '/new_user', to: 'users#create', as: :new_user
  delete '/logout', to: 'users#destroy', as: :logout
  get '/signin', to: 'users#signin', as: :sign_in
  post '/signin', to: 'users#login', as: :signin
  post '/create_opinion', to: 'opinions#create', as: :new_opinion
  get '/follow/:followed_id', to: 'friendships#create', as: :follow
end
