# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  post '/new_user', to: 'users#create', as: :new_user
end
