Rails.application.routes.draw do
  devise_for :users
  root 'time_cards#new'
  resources :time_cards
  resources :work_results
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
