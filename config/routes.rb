Rails.application.routes.draw do
  resources :buildings
  resources :floors
  resources :rooms
  resources :employees, only: %i[index show edit update destroy]
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  