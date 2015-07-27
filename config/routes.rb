Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'events/show'

  get 'events/index'

  get 'invites/create'

  get 'invites/destroy'

  root              'static_pages#home'
  
  get 'about' => 'static_pages#about'

  get 'signup' => 'users#new'
  
  get    'signin' => 'sessions#new'
  post   'signin' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users


end
