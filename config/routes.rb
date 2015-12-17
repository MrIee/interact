Rails.application.routes.draw do

  root :to => "puzzles#index"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "login" => "session#destroy"

  
  resources :users, :except => [:edit, :show, :destroy]
  get "/users/edit" => "users#edit"
  get "/users/:id/puzzles/" => "users#show_puzzles"

  resources :puzzles, :except => [:edit]
  get "/test" => "puzzles#test" 
  get "/puzzles/:title/:size" => "puzzles#show"

  resources :scores

end
