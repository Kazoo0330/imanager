Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, :only => [:index]
root 'top#index'
#  post '/users/sign_up' to: 'user#sign_up'
#  get 'events', to: 'events#show'
#  カレンダー用の記述
  resources :events 
  resources :appointments do
    collection do
      get 'appointments'
    end
  end
  resources :student_groups
#  if Rails.env.development?
#    mount LetterOpenerWeb::Engine, at: "/letter_opener"
#  end
end
