Rails.application.routes.draw do
  devise_for :users
  devise_for :patients, only: %w[registrations]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "appointments#index"
  resources :images, except: [:edit, :update, :index, :show]
  resources :appointments, except: [:edit, :update, :show]
  resource :profile, only: :show
  get "/profile/check_external_profile/:id", to: "profiles#check_external", as: "check_external_profile"
end
