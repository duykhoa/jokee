Rails.application.routes.draw do
  resource :jokes, only: [:index] do
    get 'random(.:format)', action: :random
    get :index
  end

  root 'jokes#index'
end
