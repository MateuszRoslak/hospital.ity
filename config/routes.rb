Rails.application.routes.draw do
  
  resources :posts
  resources :devices
  resources :buildings do
    resources :floors do
      resources :wards do
        resources :rooms
      end
    end
  end

  resources :employees
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  