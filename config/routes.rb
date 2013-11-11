translated_paths = { edit: 'editar' }

Receba::Application.routes.draw do
  get "dashboard/index"
  get "dashboard/performed"
  get "dashboard/received"

  # Institutional/Static pages
  controller :home do
    get 'sobre',       to: :about,    as: 'about'
    get 'termos',      to: :legal,    as: 'legal'
    get 'privacidade', to: :privacy,  as: 'privacy'
    get 'seguranca',   to: :security, as: 'security'
  end

  resources :transfers, except: [:edit, :update, :destroy]

  resources :users, path: "/", path_names: translated_paths, only: [:show, :edit, :update]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home#index'
end