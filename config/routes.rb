Rails.application.routes.draw do
  resources :o2s
  resources :enames
  resources :evaluacions do
    get "data"
  end
  resources :anuncios
  resources :horarios
  resources :consultations
  resources :noticia
  resources :jugadors
  resources :entrenadors
  devise_for :users

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  match 'evaluacions/data', to: "evaluacions#data", via: [:post, :get]
end
