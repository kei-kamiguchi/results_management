Rails.application.routes.draw do
  root 'time_cards#index'
  resources :time_cards
  resources :work_results
end
