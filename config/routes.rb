Rails.application.routes.draw do
    root to: "users#new" #!!!!want to root to user login page!!!!
    	#or should it root to 'users#new'
    resources :courses, only: [:index]  
    resources :calendars, only: [:index, :update, :create, :destroy]
    resources :departments, only: [:index, :create, :destroy]

    resources :users, only: [:new, :create, :show, :destroy]

    #these are the signup routes. 
    get 'sessions/new' => 'sessions#new' #renders a form in the browser
    post 'sessions' => 'sessions#create' #receives the form and creates a user in the database with inputs
    delete 'sessions' => 'sessions#destroy' #logs the user out of the program


end



