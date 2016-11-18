Rails.application.routes.draw do
  get 'bright_ideas/new' => 'bright_ideas#new'

  get 'bright_ideas/create' => 'bright_ideas#create'
  post 'bright_ideas/create' => 'bright_ideas#create'
  get 'bright_ideas/index' => 'bright_ideas#index'
  post 'bright_ideas/index' => 'bright_ideas#index'
  get 'bright_ideas/:id' => 'bright_ideas#show'
  delete 'bright_ideas/delete/:id' => 'bright_ideas#destroy'
  post 'bright_ideas/like/:id' => 'bright_ideas#update'

  root 'users#new'
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#login'
  get 'users/:id' => 'users#show'
  delete '/logout' => 'users#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
