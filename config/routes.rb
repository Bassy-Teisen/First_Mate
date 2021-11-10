Rails.application.routes.draw do
  get 'boats/index'
  get 'boats/new'
  get 'boats/create'
  get 'boats/show'
  get 'boats/edit'
  get 'boats/update'
  get 'boats/destroy'
  get 'profiles/index'
  get 'profiles/new'
  get 'profiles/create'
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  get 'profiles/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
