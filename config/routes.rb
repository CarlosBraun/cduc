Rails.application.routes.draw do
  resources :o2s
  resources :enames
  resources :evaluacions
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
  get '/evaluaciones', to: 'evaluacions#main_index'
  match 'search', to: "search#search", via: [:post, :get]
end
