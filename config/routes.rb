Rails.application.routes.draw do
 
  devise_for :users
  resources :users
  resources :asistencias
  resources :personas
  resources :eventos
  resources :cargos
  resources :usuarios
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'static_pages#home'
  
  #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end
