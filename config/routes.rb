Rails.application.routes.draw do
  resources :evaluacions
  default_url_options :host => "localhost"
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
end
