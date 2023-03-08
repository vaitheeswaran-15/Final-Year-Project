Rails.application.routes.draw do
  resources :teams

  devise_for :users

  root 'home#index'

  get "/join/:id", to:"teams#user" ,as:"join"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
