Rails.application.routes.draw do
  root 'time_cards#new'
  devise_for :users
  namespace :admin do
    resources :users
  end
  resources :time_cards
  resources :work_results
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
