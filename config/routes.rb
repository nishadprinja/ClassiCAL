Rails.application.routes.draw do
    # root to: "sessions#new" #!!!!want to root to user login page!!!!
    root to: "courses#index"

    resources :courses, only: [:index]
    get '/deptcourses/:id' => 'courses#department_courses', as: 'deptcourses'

    # resources :users, only: [:new, :create, :show, :destroy]

    #these are the signup routes. 
    get '/signup' => 'users#new'
    post 'users' => 'users#create'

    get '/login' => 'sessions#new' #renders a login form in the browser
    post '/login' => 'sessions#create' #receives the form and logs in a user in the database with inputs
    delete '/logout' => 'sessions#destroy' #logs the user out of the program


end



    # resources :calendars, only: [:index, :update, :create, :destroy]
    # resources :departments, only: [:index, :create, :destroy]
