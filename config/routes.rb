translated_paths = { edit: 'editar' }

Receba::Application.routes.draw do
  # Institutional/Static pages
  controller :home do
    get 'sobre',       to: :about,    as: 'about'
    get 'ajuda',       to: :help,     as: 'help'
    get 'termos',      to: :legal,    as: 'legal'
    get 'privacidade', to: :privacy,  as: 'privacy'
    get 'seguranca',   to: :security, as: 'security'
  end

  resources :transfers, except: [:edit, :update]

  resources :users, path: "/", path_names: translated_paths, only: [:show, :edit, :update]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home#index'
end