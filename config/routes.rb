Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :offers, only: :index do
        resources :user_offers, shallow: true, path: :offers, only: %i[create destroy]
      end
      # post "offers/:id/claim", to: "offers#claim", as: "claim_offer"
      # post "offers/:id/claim", to: "offers#claim", as: "unclaim_offer"
      post :login, to: "sessions#create"
    end
  end
end
