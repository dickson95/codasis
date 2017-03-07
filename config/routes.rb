Rails.application.routes.draw do
 
  resources :assignments
  resources :roles
  
  devise_for :users, :path_prefix => 'my'
  resources :users
  
  resources :personas do
    get :buscar_persona, on: :collection
  end
  resources :eventos
  resources :cargos
  
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  get 'constancia', to: 'personas#constancia', as: 'constancia'
  
  post 'personas/traer_datos', to: 'personas#traer_datos'
  
  root :to => 'static_pages#home'

end