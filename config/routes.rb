Rails.application.routes.draw do

  root :to => "puzzles#index"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "login" => "session#destroy"

  
  resources :users, :except => [:edit, :show, :destroy]
  get "/users/edit" => "users#edit"
  get "/users/puzzles/" => "users#show_puzzles"
  get "/users/view/:id" => "users#show"

  resources :puzzles, :except => [:edit, :show, :update, :destroy]
  get "/puzzles/:title/:size" => "puzzles#show"
  delete "/puzzles/delete" => "puzzles#destroy"

  post "/scores/create" => "scores#create"
  get "/leaderboard" => "scores#index"
end
