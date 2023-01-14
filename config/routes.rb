Rails.application.routes.draw do
  get 'album_info/display'
  get 'artist_info/display'
  devise_for :users
  resources :songs
  get 'search', to: "home#search"
  get 'home/profile'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
