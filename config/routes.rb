# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'opinions#index', as: :root
  get '/signup', to: 'users#new', as: :signup
  post '/new_user', to: 'users#create', as: :new_user
  get '/signin', to: 'users#signin', as: :sign_in
  post '/signin', to: 'users#login', as: :signin
  post '/create_opinion', to: 'opinions#create', as: :new_opinion
end
