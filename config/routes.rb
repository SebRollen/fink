Fink::Engine.routes.draw do
  resources :requests, only: %i[index show]
end
