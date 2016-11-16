Rails.application.routes.draw do

  resources :players

  root "players#webapp"

  put '/players' => 'players#mass_update'

  get '/stats_tracker' => 'players#stats_tracker'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
