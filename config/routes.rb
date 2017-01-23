Rails.application.routes.draw do
  resource :jokes, only: [:index] do
    get 'random(.:format)', action: :random
    get :index
  end

  resource :votes, only: [:create]

  root 'jokes#index'
end
