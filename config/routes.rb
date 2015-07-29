Rails.application.routes.draw do
    
    root 'static_pages#home'
    #match '/about',     to: 'static_pages#about',   via: 'get'
    get 'about' => 'static_pages#about'
    
    resources :users,       only: [:new, :create, :show, :index]
    #match '/signup',    to: 'users#new',            via: 'get'
    get 'signup' => 'users#new'
    
    resources :sessions,    only: [:new, :create, :destroy]
    #match '/signin',    to: 'sessions#new',         via: 'get'
    #match '/signin',    to: 'sessions#create',      via: 'post'
    #match '/signout',   to: 'sessions#destroy',     via: 'delete'
    get 'signin'        => 'sessions#new'
    post 'signin'       => 'sessions#create'
    delete 'signout'    => 'sessions#destroy'
    
    resources :events,      only: [:new, :create, :show, :index]
    
    resources :invites,     only: [:create, :destroy]
end
