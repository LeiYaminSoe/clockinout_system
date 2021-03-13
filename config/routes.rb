Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  post 'sessions/login'
  get 'sessions/logout'
  get 'sessions/home_page'
  get 'sessions/welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  root :to => "sessions#welcome"
  resources :clock_events
  resources :users
  patch '/users', to: 'users#update'
  get '/report', to: 'clock_events#report'
  get '/search', to: 'clock_events#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
