Rails.application.routes.draw do
  
  devise_for :users
  root to:"homes#top"
  
  resources :lists, only: [:new, :index, :show]
  get 'homes/top'   => "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  
  
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
