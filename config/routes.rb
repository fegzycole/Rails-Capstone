# frozen_string_literal: true

Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: :signup
  post '/new_user', to: 'users#create', as: :new_user
  get '/signin', to: 'users#signin', as: :sign_in
  post '/signin', to: 'users#login', as: :signin
  get '/:id', to: 'users#home', as: :home
end
