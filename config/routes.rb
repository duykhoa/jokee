Rails.application.routes.draw do
  resources :jokes, only: [:index]
  root 'jokes#index'
end
