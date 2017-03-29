Rails.application.routes.draw do
  #página de inicio
  root   'static_pages#inicio'

  #rutas de Users
  get    '/registro', to: 'users#new'
  post   '/registro', to: 'users#create'

  concern :paginatabla do
    get '(pagina/:page)', action: :index, on: :collection, as: ''
  end

  resources :users, concerns: :paginatabla

  #rutas de Sessions
  get    '/entrar',   to: 'sessions#new'
  post   '/entrar',   to: 'sessions#create'
  delete '/salir',    to: 'sessions#destroy'

  #rutas de ActivacionDeCuentas
  resources :activacion_cuentas, only: [:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
