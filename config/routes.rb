Rails.application.routes.draw do
  get 'player/show/:id' => 'player#show'
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
