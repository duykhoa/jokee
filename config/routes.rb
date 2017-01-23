Rails.application.routes.draw do
  resource :jokes, only: [:index] do
    get 'random(.:format)', to: :random
    get :index
  end

  root 'jokes#index'
end
