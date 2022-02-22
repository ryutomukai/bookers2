Rails.application.routes.draw do
  get "/top" => "homes#top"
  root to: "homes#top"

  devise_for :users
  
  resources :books, only:[:new, :index, :show]
  resources :users, only:[:show, ]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
