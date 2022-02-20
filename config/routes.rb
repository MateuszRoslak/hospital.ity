Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :employees
  resources :posts
  resources :devices
  resources :cleaning_reports
  resources :incident_reports
  resources :buildings do
    resources :floors do
      resources :wards do
        resources :rooms
      end
    end
  end
  resources :demand_reports do
    member do
      get :review
    end
  end
  resources :cleaning_requests do
    member do
      get :clean
    end
  end
  resources :inspections do
    member do
      get :inspect
    end
  end
end
  