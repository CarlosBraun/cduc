Rails.application.routes.draw do
  devise_for :users

  resources :tickets do
    resources :incidents, shallow: true
  end
  resources :comments
  resources :incidents
  resources :users
  resources :supervisors
  resources :support_executives
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  match 'users/add_executive/:id', to: "users#add_executive", via: [:post, :get]
  match 'users/remove_executive/:id', to: "users#remove_executive", via: [:post, :get]
  match 'tickets/solve_request/:id', to: "tickets#close_ticket", via: [:post, :get]
  match 'tickets/sort/priority', to: "tickets#sort_priority", via: [:post, :get]
  match 'search', to: "search#search", via: [:post, :get]
  
end
