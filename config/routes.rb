Rails.application.routes.draw do
 
  get 'galleries/index'
  get 'galleries/new'
  get 'galleries/create'
  get 'galleries/show'
  get 'galleries/edit'
  get 'galleries/update'
  get 'galleries/destroy'
  devise_for :users

  get 'voyages', to: 'voyages#index', as: 'voyages'
  post 'voyages', to: 'voyages#create'
  get 'voyages/about', to: 'voyages#about', as: 'about_voyage'
  get 'voyages/:id/join', to: 'voyages#join', as: 'join_voyage'
  post 'voyages/:id/joiner', to: 'voyages#joiner', as: 'joiner_voyage'
  get 'voyages/new', to: 'voyages#new', as: 'new_voyage'
  get 'voyages/:id/edit', to: 'voyages#edit', as: 'edit_voyage'
  get 'voyages/:id', to: 'voyages#show', as: 'voyage'
  patch 'voyages/:id', to: 'voyages#update'
  delete 'voyages/:id', to: 'voyages#destroy'

  get 'boats', to: 'boats#index', as: 'boats'
  post 'boats', to: 'boats#create'
  get 'boats/new', to: 'boats#new', as: 'new_boat'
  get 'boats/:id/edit', to: 'boats#edit', as: 'edit_boat'
  get 'boats/:id', to: 'boats#show', as: 'boat'
  patch 'boats/:id', to: 'boats#update'
  delete 'boats/:id', to: 'boats#destroy'
  
  get '/profiles', to: 'profiles#index', as: "profiles"
  post '/profiles', to: 'profiles#create'
  get '/profiles/new', to: 'profiles#new', as: 'new_profile'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profiles/:id', to: 'profiles#update'
  delete '/profiles/:id', to: 'profiles#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'voyages#index'
end