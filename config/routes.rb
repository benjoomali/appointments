Rails.application.routes.draw do
  resources :appointments
  #resources :form_entries
  resources :calendars
  resources :forms do 
    resources :form_entries
  end 
  resources :schedules
  resources :availabilities
  devise_for :users

  root to: 'availabilities#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
