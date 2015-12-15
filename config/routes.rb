Rails.application.routes.draw do

  root :to => "pages#index"

  resources :users, :except => [:edit]
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "login" => "session#destroy"

  get "/test" => "puzzles#test" 
  get "/puzzles/:title/:size" => "puzzles#show"
  get "/puzzles" => "puzzles#index"

  get "/bootstrap/demo" => "pages#bootstrap"

end
