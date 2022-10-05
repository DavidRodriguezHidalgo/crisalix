Rails.application.routes.draw do
  devise_for :users
  devise_for :patients
  devise_for :doctors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "appointments#index"
  resources :images, except: [:edit, :update]
  resources :appointments, except: [:edit, :update]
end
