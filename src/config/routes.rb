Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "todos#index"
  post "/add", to: "todos#add"

  get "/search", to: "todos#search"
  post "/search", to: "todos#search"

  get "/todos/:id", to: "todos#edit"
  post "/todos/:id", to: "todos#update"

end
