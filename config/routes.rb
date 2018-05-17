Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'top#index'

#  get 'events', to: 'events#show'
#  カレンダー用の記述
  resources :events 
  resources :appointments do
    collection do
      get 'appointments'
    end
  end
  resources :student_groups
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
