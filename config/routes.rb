Rails.application.routes.draw do

  resources :topics do
    resources :posts do
      get 'user_profile'
    end
  end
  resources :projects do
    resources :tasks
  end
  resources :teams
  devise_for :users

  root 'home#index'

  get "/join/:id", to:"teams#user" ,as:"join"
  get "/view/:id", to:"teams#view_team", as:"view_team"
  delete "/exit/:id", to:"teams#team_exit", as:"exit_team"
  get "/analytics/:id", to:"home#analytics" ,as:"analytics"
  get "/notify_users", to: "tasks#notify_developers", as:"notify_developers"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
