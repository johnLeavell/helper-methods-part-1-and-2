Rails.application.routes.draw do
  resources :movies

  # root "movies#index"

  # # CREATE
  # post "/movies" => "movies#create", as: :movies
  # get "/movies/new" => "movies#new", as: :new_movie
          
  # # READ
  # get "/movies" => "movies#index"
  # get "/movies/:id" => "movies#show", as: :movie
  
  # # UPDATE
  # post "/movies/:id" => "movies#update"
  # post "/movies/:id/edit" => "movies#edit", as: :edit_movie
  
  # # DELETE
  # delete "/movies/:id" => "movies#destroy"
end
