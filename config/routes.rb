Rails.application.routes.draw do
  resources :users
  root :to => "puzzles#puzzle"
  get "/test" => "puzzles#test" 
  get "/puzzle/:title" => "puzzles#puzzle"
  get "/puzzle" => "puzzles#puzzle"

end
