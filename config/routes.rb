Rails.application.routes.draw do
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  resources :o2s
  resources :enames
  resources :evaluacions
  resources :anuncios
  resources :horarios
  resources :consultations
  resources :noticia
  resources :jugadors
  resources :entrenadors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get '/evaluaciones', to: 'evaluacions#main_index'
  get '/busqueda', to: "jugadors#search"
end
