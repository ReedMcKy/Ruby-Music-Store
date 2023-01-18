Rails.application.routes.draw do
  get 'search_artist/display'
  get 'album_info/display'
  get 'artist_info/display'
  devise_for :users
  resources :songs
  get 'home/profile'
  post 'album_info/display', to: 'songs#index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
