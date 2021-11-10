Rails.application.routes.draw do
 
  get 'boats', to: 'boats#index', as: 'boats'
  get 'boats', to: 'boats#create'
  get 'boats/new', to: 'boats#new', as: 'new_boat'
  get 'boats/:id/edit', to: 'boats#edit', as: 'boat_edit'
  get 'boats/:id', to: 'boats#show', as: 'boat'
  get 'boats/:id', to: 'boats#update'
  get 'boats/:id', to: 'boats#destroy'
  
  get '/profiles', to: 'profiles#index', as: "profiles"
  post '/profiles', to: 'profiles#create'
  get '/profiles/new', to: 'profiles#new', as: 'new_profile'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  get '/profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profiles/:id', to: 'profiles#update'
  delete '/profiles/:id', to: 'profiles#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'profiles#index'
end