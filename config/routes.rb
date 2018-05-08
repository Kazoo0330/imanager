Rails.application.routes.draw do

  resources :appointments
  resources :event_days
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'events#index'

  resources :events
  resources :student_groups
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
