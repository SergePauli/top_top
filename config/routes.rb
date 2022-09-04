Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  post "/message", to: "messages#index"
end
