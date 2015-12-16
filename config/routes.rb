Rails.application.routes.draw do

  root :to => "puzzles#index"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "login" => "session#destroy"

  get "/users/edit" => "users#edit"
  resources :users, :except => [:edit]

  resources :puzzles, :except => [:edit]
  get "/test" => "puzzles#test" 
  get "/puzzles/:title/:size" => "puzzles#show"
  get "/puzzles/:id" => "puzzles#user"

  get "/bootstrap/demo" => "pages#bootstrap"

end
