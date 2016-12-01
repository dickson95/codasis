Rails.application.routes.draw do
 
  resources :assignments
  resources :roles
  devise_for :users
  resources :users
  resources :personas
  resources :eventos
  resources :cargos
  
   
  
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  root :to => 'static_pages#home'
  
end
