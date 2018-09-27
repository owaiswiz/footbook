Rails.application.routes.draw do
  get 'player/search/:name' => 'player#search'
  get 'player/show/:id' => 'player#show'
  get 'player/stars/:id' => 'player#stars'
  post 'player/rate/:id' => 'player#rate'
  get 'players/compare' => 'player#compare'
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
