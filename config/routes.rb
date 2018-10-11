Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'player/search/:name' => 'player#search'
  get 'player/show/:id' => 'player#show'
  get 'player/json/:id' => 'player#json'
  get 'players/json' => 'player#players_json'
  get 'player/stars/:id' => 'player#stars'
  post 'player/rate/:id' => 'player#rate'
  get 'players/compare' => 'player#select_to_compare'
  post 'players/compare' => 'player#compare'
  get 'players/rankings' => 'player#rankings'
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
