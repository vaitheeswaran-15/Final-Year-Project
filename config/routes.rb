Rails.application.routes.draw do
  resources :teams
  devise_for :users

  root 'home#index'

  get "/join/:id", to:"teams#user" ,as:"join"
  get "/view/:id", to:"teams#view_team", as:"view_team"
  delete "/exit/:id", to:"teams#team_exit", as:"exit_team"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
