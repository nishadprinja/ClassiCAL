Rails.application.routes.draw do
    root to: "users#new" #!!!!want to root to user login page!!!!
    	#or should it root to 'users#new'
    resources :courses, only: [:index]  
    resources :calendars, only: [:index, :update, :create, :destroy]
    resources :departments, only: [:index, :create, :destroy]

    resources :users, only: [:new, :create, :show, :destroy]

    get 'sessions/new' => 'sessions#new'
    post 'sessions' => 'sessions#create'
    delete 'sessions' => 'sessions#destroy'
end



