Rails.application.routes.draw do
    root to: 'application#index' #!!!!want to root to user login page!!!!
    resources :courses, only: [:index]  
    # resources :users, only: [:index, :update, :create, :destroy]
    resources :calendars, only: [:index, :update, :create, :destroy]
    resources :departments, only: [:index, :create, :destroy]
    resources :professors, only: [:index, :create, :destroy]
end