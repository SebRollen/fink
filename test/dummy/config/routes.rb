Rails.application.routes.draw do
  resources :pages, only: :index
  mount Fink::Engine => "/fink"
end
