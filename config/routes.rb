Rails.application.routes.draw do

  root :to => "puzzles#index"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "login" => "session#destroy"

  
  resources :users, :except => [:edit, :show, :destroy]
  get "/users/edit" => "users#edit"
  get "/users/:id/puzzles/" => "users#show_puzzles"

  resources :puzzles, :except => [:edit, :show, :update]
  get "/puzzles/:title/:size" => "puzzles#show"

  post "/scores/create" => "scores#create"
  get "/scores/leaderboard" => "scores#index"

end
