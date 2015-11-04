Rails.application.routes.draw do
  #Home
  root 'home#index'

  get "/login" => "session#new"
  post "/login" => "session#create"
  get "/log-out" => "session#destroy", as: :log_out

  resources 'home', only: :index


  resources :users, only: [:index, :new, :create, :show, :edit]

end
