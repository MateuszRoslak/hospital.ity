Rails.application.routes.draw do
  
  resources :cleaning_requests
  resources :cleaning_reports
  resources :incident_reports
  resources :inspections do
    member do
      get :inspect
    end
  end
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
  