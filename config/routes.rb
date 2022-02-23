Rails.application.routes.draw do
  get "/top" => "homes#top"
  root to: "homes#top"
  get "/homes/about"=>"homes#about",as:"about"

  devise_for :users

  resources :books, only:[:new, :index, :show, :create, :destroy, :edit, :update]
  resources :users, only:[:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
