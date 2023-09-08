Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :offers, only: :index
      post :login, to: "sessions#create"
    end
  end
end
