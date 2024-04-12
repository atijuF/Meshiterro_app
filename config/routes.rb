Rails.application.routes.draw do
  
  devise_for :users
  root to:"homes#top"
  get 'homes/top'   => "homes#top"
  get 'homes/about' => "homes#about"
  get '/about' => "homes#about"
  
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
